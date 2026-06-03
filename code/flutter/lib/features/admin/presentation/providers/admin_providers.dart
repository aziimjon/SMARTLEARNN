import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection.dart';
import '../../../auth/data/models/permission.dart';
import '../../../auth/data/models/role.dart';
import '../../../courses/data/models/course_response.dart';
import '../../../courses/data/models/course_section_response.dart';
import '../../../courses/data/models/lesson_response.dart';
import '../../../courses/domain/repositories/course_repository.dart';
import '../../../groups/data/models/group_response.dart';
import '../../../groups/domain/repositories/group_repository.dart';
import '../../../online_courses/data/models/online_course_response.dart';
import '../../../online_courses/data/models/online_course_summary_response.dart';
import '../../../online_courses/domain/repositories/online_course_repository.dart';
import '../../data/models/teacher_profile_response.dart';
import '../../data/models/user_preview.dart';
import '../../domain/repositories/permission_repository.dart';
import '../../domain/repositories/role_repository.dart';
import '../../domain/repositories/user_repository.dart';

part 'admin_providers.g.dart';

// ── Repository bridges ────────────────────────────────────────────────────────

final userRepositoryProvider =
    Provider<UserRepository>((ref) => getIt<UserRepository>());

final adminCourseRepositoryProvider =
    Provider<CourseRepository>((ref) => getIt<CourseRepository>());

final adminGroupRepositoryProvider =
    Provider<GroupRepository>((ref) => getIt<GroupRepository>());

// ── Users ─────────────────────────────────────────────────────────────────────

@riverpod
class AdminUsersNotifier extends _$AdminUsersNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String _search = '';
  String? _role;
  final List<UserPreview> _items = [];

  @override
  Future<List<UserPreview>> build() => _load(reset: true);

  Future<List<UserPreview>> _load({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref.read(userRepositoryProvider).getUsers(
          search: _search.isEmpty ? null : _search,
          role: _role,
          page: _page,
          size: 10,
        );
    return result.fold(
      (f) => throw f,
      (p) {
        _hasNext = p.hasNext;
        _items.addAll(p.results);
        return List<UserPreview>.unmodifiable(_items);
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

  Future<void> filterByRole(String? role) async {
    _role = role;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

// ── Courses ───────────────────────────────────────────────────────────────────

@riverpod
class AdminCoursesNotifier extends _$AdminCoursesNotifier {
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
    final result = await ref.read(adminCourseRepositoryProvider).getCourses(
          search: _search.isEmpty ? null : _search,
          page: _page,
          size: 10,
        );
    return result.fold(
      (f) => throw f,
      (p) {
        _hasNext = p.hasNext;
        _items.addAll(p.results);
        return List<CourseResponse>.unmodifiable(_items);
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
Future<List<CourseSectionResponse>> adminCourseSections(
    Ref ref, String courseId) async {
  final result = await ref
      .watch(adminCourseRepositoryProvider)
      .getSections(courseId: courseId);
  return result.fold((f) => throw f, (p) => p.results);
}

@riverpod
Future<List<LessonResponse>> adminSectionLessons(
    Ref ref, String sectionId) async {
  final result = await ref
      .watch(adminCourseRepositoryProvider)
      .getLessons(sectionId: sectionId);
  return result.fold((f) => throw f, (p) => p.results);
}

// ── Groups ────────────────────────────────────────────────────────────────────

@riverpod
class AdminGroupsNotifier extends _$AdminGroupsNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String _search = '';
  String? _status;
  final List<GroupResponse> _items = [];

  @override
  Future<List<GroupResponse>> build() => _load(reset: true);

  Future<List<GroupResponse>> _load({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref.read(adminGroupRepositoryProvider).getGroups(
          search: _search.isEmpty ? null : _search,
          status: _status,
          page: _page,
          size: 10,
        );
    return result.fold(
      (f) => throw f,
      (p) {
        _hasNext = p.hasNext;
        _items.addAll(p.results);
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

  Future<void> filterByStatus(String? status) async {
    _status = status;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

@riverpod
Future<GroupResponse> adminGroupDetail(Ref ref, String id) async {
  final result =
      await ref.watch(adminGroupRepositoryProvider).getGroup(id);
  return result.fold((f) => throw f, (g) => g);
}

// ── Teacher picker ────────────────────────────────────────────────────────────

@riverpod
Future<List<TeacherProfileResponse>> teacherPickerList(
    Ref ref, String search) async {
  final result = await ref
      .watch(userRepositoryProvider)
      .getTeachers(search: search.isEmpty ? null : search);
  return result.fold((f) => throw f, (p) => p.results);
}

// ── Course picker (reuses existing repo) ──────────────────────────────────────

@riverpod
Future<List<CourseResponse>> coursePickerList(
    Ref ref, String search) async {
  final result = await ref
      .watch(adminCourseRepositoryProvider)
      .getCourses(search: search.isEmpty ? null : search, size: 50);
  return result.fold((f) => throw f, (p) => p.results);
}

// ── Online Courses (Admin) ────────────────────────────────────────────────────

final adminOnlineCourseRepositoryProvider = Provider<OnlineCourseRepository>(
  (ref) => getIt<OnlineCourseRepository>(),
);

@riverpod
class AdminOnlineCoursesNotifier extends _$AdminOnlineCoursesNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String _search = '';
  final List<OnlineCourseSummaryResponse> _items = [];

  @override
  Future<List<OnlineCourseSummaryResponse>> build() => _load(reset: true);

  Future<List<OnlineCourseSummaryResponse>> _load(
      {bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref
        .read(adminOnlineCourseRepositoryProvider)
        .getCourses(
          search: _search.isEmpty ? null : _search,
          page: _page,
          size: 10,
        );
    return result.fold(
      (f) => throw f,
      (p) {
        _hasNext = p.hasNext;
        _items.addAll(p.results);
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

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }
}

@riverpod
Future<OnlineCourseResponse> adminOnlineCourseDetail(
    Ref ref, String courseId) async {
  final result = await ref
      .watch(adminOnlineCourseRepositoryProvider)
      .getCourse(courseId);
  return result.fold((f) => throw f, (c) => c);
}

// ── Roles ─────────────────────────────────────────────────────────────────────

final roleRepositoryProvider =
    Provider<RoleRepository>((ref) => getIt<RoleRepository>());

@riverpod
class AdminRolesNotifier extends _$AdminRolesNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  final List<Role> _items = [];

  @override
  Future<List<Role>> build() => _load(reset: true);

  Future<List<Role>> _load({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref
        .read(roleRepositoryProvider)
        .getRoles(page: _page, size: 20);
    return result.fold(
      (f) => throw f,
      (p) {
        _hasNext = p.hasNext;
        _items.addAll(p.results);
        return List<Role>.unmodifiable(_items);
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

  Future<bool> createRole(String name) async {
    final result =
        await ref.read(roleRepositoryProvider).createRole(name);
    return result.fold((_) => false, (_) => true);
  }

  Future<bool> updateRole(String id, String name) async {
    final result =
        await ref.read(roleRepositoryProvider).updateRole(id, name);
    return result.fold((_) => false, (_) => true);
  }

  Future<bool> deleteRole(String id) async {
    final result =
        await ref.read(roleRepositoryProvider).deleteRole(id);
    return result.fold((_) => false, (_) => true);
  }
}

@riverpod
Future<Role> adminRoleDetail(Ref ref, String id) async {
  final result = await ref.watch(roleRepositoryProvider).getRole(id);
  return result.fold((f) => throw f, (r) => r);
}

// ── Permissions ───────────────────────────────────────────────────────────────

final permissionRepositoryProvider =
    Provider<PermissionRepository>((ref) => getIt<PermissionRepository>());

@riverpod
class AdminPermissionsNotifier extends _$AdminPermissionsNotifier {
  int _page = 1;
  bool _hasNext = false;
  bool _isLoadingMore = false;
  String? _category;
  final List<Permission> _items = [];

  @override
  Future<List<Permission>> build() => _load(reset: true);

  Future<List<Permission>> _load({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _items.clear();
    }
    final result = await ref.read(permissionRepositoryProvider).getPermissions(
          category: _category,
          page: _page,
          size: 20,
        );
    return result.fold(
      (f) => throw f,
      (p) {
        _hasNext = p.hasNext;
        _items.addAll(p.results);
        return List<Permission>.unmodifiable(_items);
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

  Future<void> filterByCategory(String? category) async {
    _category = category;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(reset: true));
  }

  Future<bool> createPermission(String name, String category) async {
    final result = await ref
        .read(permissionRepositoryProvider)
        .createPermission(name, category);
    return result.fold((_) => false, (_) => true);
  }

  Future<bool> updatePermission(String id, String name, String category) async {
    final result = await ref
        .read(permissionRepositoryProvider)
        .updatePermission(id, name, category);
    return result.fold((_) => false, (_) => true);
  }

  Future<bool> deletePermission(String id) async {
    final result = await ref
        .read(permissionRepositoryProvider)
        .deletePermission(id);
    return result.fold((_) => false, (_) => true);
  }
}

// ── User Role Management ──────────────────────────────────────────────────────

@riverpod
class AdminUserRolesNotifier extends _$AdminUserRolesNotifier {
  @override
  Future<List<Role>> build(String userId) async {
    final result =
        await ref.read(userRepositoryProvider).getUserRoles(userId);
    return result.fold((f) => throw f, (roles) => roles);
  }

  Future<void> refresh(String userId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result =
          await ref.read(userRepositoryProvider).getUserRoles(userId);
      return result.fold((f) => throw f, (roles) => roles);
    });
  }

  Future<bool> setRoles(String userId, List<String> roleIds) async {
    final result =
        await ref.read(userRepositoryProvider).setUserRoles(userId, roleIds);
    return result.fold((_) => false, (_) => true);
  }

  Future<bool> addRole(String userId, String roleId) async {
    final result =
        await ref.read(userRepositoryProvider).addUserRole(userId, roleId);
    return result.fold((_) => false, (_) => true);
  }

  Future<bool> removeRole(String userId, String roleId) async {
    final result =
        await ref.read(userRepositoryProvider).removeUserRole(userId, roleId);
    return result.fold((_) => false, (_) => true);
  }
}
