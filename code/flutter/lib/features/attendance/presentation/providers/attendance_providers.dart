import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../schedule/data/models/lesson_session_response.dart';
import '../../../schedule/domain/repositories/lesson_session_repository.dart';
import '../../data/models/attendance_response.dart';
import '../../domain/repositories/attendance_repository.dart';

part 'attendance_providers.g.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>(
  (ref) => getIt<AttendanceRepository>(),
);

final _lessonSessionRepoProvider = Provider<LessonSessionRepository>(
  (ref) => getIt<LessonSessionRepository>(),
);

// ─── Student: weekly schedule ─────────────────────────────────────────────────

@riverpod
Future<List<AttendanceResponse>> weeklyAttendance(
  Ref ref,
  DateTime weekStart,
) async {
  final userId = ref.watch(authNotifierProvider).user?.id;
  if (userId == null) return [];

  final weekEnd = weekStart.add(const Duration(days: 7));
  final result = await ref.watch(attendanceRepositoryProvider).getAttendances(
        studentId: userId,
        from: weekStart,
        to: weekEnd,
        size: 100,
      );
  return result.fold((f) => throw f, (p) => p.results);
}

// ─── Student: full attendance history ────────────────────────────────────────

@riverpod
class AttendanceHistoryNotifier extends _$AttendanceHistoryNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  final List<AttendanceResponse> _items = [];

  @override
  Future<List<AttendanceResponse>> build() => _load(reset: true);

  Future<List<AttendanceResponse>> _load({bool reset = false}) async {
    final userId = ref.read(authNotifierProvider).user?.id;
    if (userId == null) return [];

    if (reset) {
      _page = 1;
      _items.clear();
    }

    final result = await ref.read(attendanceRepositoryProvider).getAttendances(
          studentId: userId,
          page: _page,
          size: 15,
        );

    return result.fold(
      (f) => throw f,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<AttendanceResponse>.unmodifiable(_items);
      },
    );
  }

  bool get hasNext => _hasNext;

  Future<void> loadMore() async {
    if (!_hasNext || _isLoadingMore || state.isLoading) return;
    _isLoadingMore = true;
    _page++;
    state = await AsyncValue.guard(() => _load());
    _isLoadingMore = false;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

// ─── Teacher: session detail & existing attendances ───────────────────────────

@riverpod
Future<LessonSessionResponse> sessionForAttendance(
    Ref ref, String sessionId) async {
  final result = await ref
      .watch(_lessonSessionRepoProvider)
      .getLessonSession(sessionId);
  return result.fold((f) => throw f, (s) => s);
}

@riverpod
Future<List<AttendanceResponse>> sessionAttendances(
    Ref ref, String sessionId) async {
  final result = await ref
      .watch(attendanceRepositoryProvider)
      .getAttendances(lessonSessionId: sessionId, size: 100);
  return result.fold((f) => throw f, (p) => p.results);
}

// ─── Teacher: unique students from group history ──────────────────────────────

class StudentEntry {
  final String studentId;
  final String fullName;

  const StudentEntry({required this.studentId, required this.fullName});
}

@riverpod
Future<List<StudentEntry>> groupStudentRoster(
    Ref ref, String groupId) async {
  final result = await ref
      .watch(attendanceRepositoryProvider)
      .getAttendances(groupId: groupId, size: 200);
  return result.fold(
    (f) => throw f,
    (p) {
      final seen = <String>{};
      final students = <StudentEntry>[];
      for (final a in p.results) {
        if (seen.add(a.studentId)) {
          students.add(StudentEntry(
            studentId: a.studentId,
            fullName: a.studentFullName ?? a.studentId,
          ));
        }
      }
      students.sort((a, b) => a.fullName.compareTo(b.fullName));
      return students;
    },
  );
}

// ─── Teacher: mark attendance state ──────────────────────────────────────────

class MarkAttendanceState {
  final Map<String, String> marks; // studentId → status
  final bool isSaving;
  final String? error;
  final bool saved;

  const MarkAttendanceState({
    this.marks = const {},
    this.isSaving = false,
    this.error,
    this.saved = false,
  });

  MarkAttendanceState copyWith({
    Map<String, String>? marks,
    bool? isSaving,
    String? error,
    bool? saved,
  }) =>
      MarkAttendanceState(
        marks: marks ?? this.marks,
        isSaving: isSaving ?? this.isSaving,
        error: error,
        saved: saved ?? this.saved,
      );
}

class MarkAttendanceNotifier
    extends FamilyNotifier<MarkAttendanceState, String> {
  @override
  MarkAttendanceState build(String sessionId) => const MarkAttendanceState();

  void initFromExisting(List<AttendanceResponse> existing) {
    final marks = <String, String>{
      for (final a in existing) a.studentId: a.status,
    };
    state = MarkAttendanceState(marks: marks);
  }

  void setMark(String studentId, String status) {
    final updated = Map<String, String>.from(state.marks);
    updated[studentId] = status;
    state = state.copyWith(marks: updated, saved: false);
  }

  Future<void> save() async {
    final sessionId = arg;
    state = state.copyWith(isSaving: true, error: null);
    final repo = ref.read(attendanceRepositoryProvider);

    final existing = await repo.getAttendances(
        lessonSessionId: sessionId, size: 100);
    final existingMap = <String, AttendanceResponse>{};
    existing.fold((_) {}, (p) {
      for (final a in p.results) {
        existingMap[a.studentId] = a;
      }
    });

    final errors = <String>[];
    for (final entry in state.marks.entries) {
      final studentId = entry.key;
      final status = entry.value;
      final exist = existingMap[studentId];
      if (exist != null) {
        final result = await repo.updateAttendance(
          id: exist.id,
          studentId: studentId,
          lessonSessionId: sessionId,
          status: status,
        );
        result.fold((f) => errors.add(f.message), (_) {});
      } else {
        final result = await repo.createAttendance(
          studentId: studentId,
          lessonSessionId: sessionId,
          status: status,
        );
        result.fold((f) => errors.add(f.message), (_) {});
      }
    }

    if (errors.isNotEmpty) {
      state = state.copyWith(isSaving: false, error: errors.first);
    } else {
      state = state.copyWith(isSaving: false, saved: true);
      ref.invalidate(sessionAttendancesProvider(sessionId));
    }
  }
}

final markAttendanceProvider = NotifierProvider.family<MarkAttendanceNotifier,
    MarkAttendanceState, String>(MarkAttendanceNotifier.new);
