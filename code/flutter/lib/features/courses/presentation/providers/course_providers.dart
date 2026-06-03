import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection.dart';
import '../../data/models/course_response.dart';
import '../../data/models/lesson_response.dart';
import '../../domain/repositories/course_repository.dart';

part 'course_providers.g.dart';

// Мост между getIt и Riverpod — один раз, используется везде
final courseRepositoryProvider = Provider<CourseRepository>(
  (ref) => getIt<CourseRepository>(),
);

// Список курсов с пагинацией и поиском
@riverpod
class CoursesNotifier extends _$CoursesNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String _search = '';
  final List<CourseResponse> _items = [];

  @override
  Future<List<CourseResponse>> build() => _load(reset: true);

  Future<List<CourseResponse>> _load({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref.read(courseRepositoryProvider).getCourses(
          page: _page,
          size: 10,
          search: _search.isEmpty ? null : _search,
        );
    return result.fold(
      (failure) => throw failure,
      (paginated) {
        _hasNext = paginated.hasNext;
        _items.addAll(paginated.results);
        return List<CourseResponse>.unmodifiable(_items);
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

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

// Детальная страница курса — принимает id
@riverpod
Future<CourseResponse> courseDetail(Ref ref, String id) async {
  final result = await ref.watch(courseRepositoryProvider).getCourse(id);
  return result.fold((failure) => throw failure, (course) => course);
}

// Экран урока — принимает id
@riverpod
Future<LessonResponse> lessonDetail(Ref ref, String id) async {
  final result = await ref.watch(courseRepositoryProvider).getLesson(id);
  return result.fold((failure) => throw failure, (lesson) => lesson);
}
