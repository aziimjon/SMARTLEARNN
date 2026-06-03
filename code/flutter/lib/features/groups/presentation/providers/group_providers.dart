import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection.dart';
import '../../../schedule/data/models/lesson_session_response.dart';
import '../../../schedule/domain/repositories/lesson_session_repository.dart';
import '../../data/models/group_response.dart';
import '../../data/models/schedule_response.dart';
import '../../domain/repositories/group_repository.dart';

part 'group_providers.g.dart';

final lessonSessionRepositoryProvider =
    Provider<LessonSessionRepository>((ref) => getIt<LessonSessionRepository>());

final groupRepositoryProvider =
    Provider<GroupRepository>((ref) => getIt<GroupRepository>());

@riverpod
class TeacherGroupsNotifier extends _$TeacherGroupsNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String _search = '';
  final List<GroupResponse> _items = [];

  @override
  Future<List<GroupResponse>> build() => _load(reset: true);

  Future<List<GroupResponse>> _load({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref.read(groupRepositoryProvider).getGroups(
          search: _search.isEmpty ? null : _search,
          page: _page,
          size: 10,
        );
    return result.fold(
      (f) => throw f,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<GroupResponse>.unmodifiable(_items);
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

  Future<void> search(String query) async {
    _search = query;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

@riverpod
Future<GroupResponse> groupDetail(Ref ref, String id) async {
  final result = await ref.watch(groupRepositoryProvider).getGroup(id);
  return result.fold((f) => throw f, (g) => g);
}

@riverpod
Future<List<ScheduleResponse>> groupSchedules(Ref ref, String groupId) async {
  final result = await ref
      .watch(groupRepositoryProvider)
      .getSchedules(groupId: groupId);
  return result.fold((f) => throw f, (p) => p.results);
}

@riverpod
Future<List<LessonSessionResponse>> groupSessions(
    Ref ref, String groupId) async {
  final now = DateTime.now();
  final from = now.subtract(const Duration(days: 30));
  final to = now.add(const Duration(days: 30));
  final result = await ref
      .watch(lessonSessionRepositoryProvider)
      .getLessonSessions(groupId: groupId, from: from, to: to, size: 50);
  return result.fold((f) => throw f, (p) => p.results);
}

@riverpod
Future<List<LessonSessionResponse>> groupUpcomingSessions(
    Ref ref, String groupId) async {
  final now = DateTime.now();
  final to = now.add(const Duration(days: 14));
  final result = await ref
      .watch(lessonSessionRepositoryProvider)
      .getLessonSessions(
        groupId: groupId,
        from: now,
        to: to,
        status: 'PLANNED',
        size: 20,
      );
  return result.fold((f) => throw f, (p) => p.results);
}
