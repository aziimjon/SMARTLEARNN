import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/injection.dart';
import '../../data/models/online_course_enrollment_response.dart';
import '../../data/models/online_course_response.dart';
import '../../data/models/online_course_summary_response.dart';
import '../../domain/repositories/online_course_repository.dart';

part 'online_course_providers.g.dart';

final onlineCourseRepositoryProvider = Provider<OnlineCourseRepository>(
  (ref) => getIt<OnlineCourseRepository>(),
);

// ── Список онлайн-курсов ──────────────────────────────────────────────────

@riverpod
class OnlineCoursesNotifier extends _$OnlineCoursesNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String _search = '';
  String? _level;
  String? _statusFilter;
  final List<OnlineCourseSummaryResponse> _items = [];

  @override
  Future<List<OnlineCourseSummaryResponse>> build() => _load(reset: true);

  Future<List<OnlineCourseSummaryResponse>> _load(
      {bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref.read(onlineCourseRepositoryProvider).getCourses(
          page: _page,
          size: 10,
          search: _search.isEmpty ? null : _search,
          level: _level,
          status: _statusFilter,
        );
    return result.fold(
      (failure) => throw failure,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<OnlineCourseSummaryResponse>.unmodifiable(_items);
      },
    );
  }

  bool get hasNext => _hasNext;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadMore() async {
    if (!_hasNext || _isLoadingMore || state.isLoading) return;
    _isLoadingMore = true;
    _page++;
    state = await AsyncValue.guard(() => _load());
    _isLoadingMore = false;
  }

  Future<void> search(String query) async {
    _search = query;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> filterByLevel(String? level) async {
    _level = level;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> filterByStatus(String? status) async {
    _statusFilter = status;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

// ── Детальная страница курса ──────────────────────────────────────────────

@riverpod
Future<OnlineCourseResponse> onlineCourseDetail(
    Ref ref, String courseId) async {
  final result = await ref
      .watch(onlineCourseRepositoryProvider)
      .getCourse(courseId);
  return result.fold((failure) => throw failure, (course) => course);
}

// ── Мои записи (student) ──────────────────────────────────────────────────

@riverpod
class MyEnrollmentsNotifier extends _$MyEnrollmentsNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String? _statusFilter;
  final List<OnlineCourseEnrollmentResponse> _items = [];

  @override
  Future<List<OnlineCourseEnrollmentResponse>> build() => _load(reset: true);

  Future<List<OnlineCourseEnrollmentResponse>> _load(
      {bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref
        .read(onlineCourseRepositoryProvider)
        .getMyEnrollments(
          page: _page,
          size: 10,
          status: _statusFilter,
        );
    return result.fold(
      (failure) => throw failure,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<OnlineCourseEnrollmentResponse>.unmodifiable(_items);
      },
    );
  }

  bool get hasNext => _hasNext;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadMore() async {
    if (!_hasNext || _isLoadingMore || state.isLoading) return;
    _isLoadingMore = true;
    _page++;
    state = await AsyncValue.guard(() => _load());
    _isLoadingMore = false;
  }

  Future<void> filterByStatus(String? status) async {
    _statusFilter = status;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

// ── Все записи — admin view ───────────────────────────────────────────────

@riverpod
class AllEnrollmentsNotifier extends _$AllEnrollmentsNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String? _courseId;
  String? _studentProfileId;
  String? _statusFilter;
  final List<OnlineCourseEnrollmentResponse> _items = [];

  @override
  Future<List<OnlineCourseEnrollmentResponse>> build() => _load(reset: true);

  Future<List<OnlineCourseEnrollmentResponse>> _load(
      {bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref
        .read(onlineCourseRepositoryProvider)
        .getAllEnrollments(
          page: _page,
          size: 10,
          courseId: _courseId,
          studentProfileId: _studentProfileId,
          status: _statusFilter,
        );
    return result.fold(
      (failure) => throw failure,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<OnlineCourseEnrollmentResponse>.unmodifiable(_items);
      },
    );
  }

  bool get hasNext => _hasNext;
  bool get isLoadingMore => _isLoadingMore;

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

// ── Записи конкретного студента ───────────────────────────────────────────

@riverpod
class StudentEnrollmentsNotifier extends _$StudentEnrollmentsNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  final List<OnlineCourseEnrollmentResponse> _items = [];

  @override
  Future<List<OnlineCourseEnrollmentResponse>> build(
      String studentProfileId) =>
      _load(studentProfileId, reset: true);

  Future<List<OnlineCourseEnrollmentResponse>> _load(
    String studentProfileId, {
    bool reset = false,
  }) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref
        .read(onlineCourseRepositoryProvider)
        .getStudentEnrollments(studentProfileId, page: _page, size: 10);
    return result.fold(
      (failure) => throw failure,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<OnlineCourseEnrollmentResponse>.unmodifiable(_items);
      },
    );
  }

  bool get hasNext => _hasNext;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> loadMore(String studentProfileId) async {
    if (!_hasNext || _isLoadingMore || state.isLoading) return;
    _isLoadingMore = true;
    _page++;
    state = await AsyncValue.guard(() => _load(studentProfileId));
    _isLoadingMore = false;
  }

  Future<void> refresh(String studentProfileId) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _load(studentProfileId, reset: true));
  }
}
