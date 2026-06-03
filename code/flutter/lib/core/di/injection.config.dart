// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/admin/data/repositories/permission_repository_impl.dart'
    as _i996;
import '../../features/admin/data/repositories/role_repository_impl.dart'
    as _i176;
import '../../features/admin/data/repositories/user_repository_impl.dart'
    as _i738;
import '../../features/admin/domain/repositories/permission_repository.dart'
    as _i462;
import '../../features/admin/domain/repositories/role_repository.dart' as _i263;
import '../../features/admin/domain/repositories/user_repository.dart' as _i760;
import '../../features/attendance/data/repositories/attendance_repository_impl.dart'
    as _i719;
import '../../features/attendance/domain/repositories/attendance_repository.dart'
    as _i477;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/presentation/providers/auth_notifier.dart' as _i725;
import '../../features/courses/data/repositories/course_repository_impl.dart'
    as _i657;
import '../../features/courses/domain/repositories/course_repository.dart'
    as _i749;
import '../../features/groups/data/repositories/group_repository_impl.dart'
    as _i335;
import '../../features/groups/domain/repositories/group_repository.dart'
    as _i324;
import '../../features/online_courses/data/repositories/online_course_repository_impl.dart'
    as _i211;
import '../../features/online_courses/domain/repositories/online_course_repository.dart'
    as _i839;
import '../../features/schedule/data/repositories/lesson_session_repository_impl.dart'
    as _i775;
import '../../features/schedule/domain/repositories/lesson_session_repository.dart'
    as _i71;
import '../network/auth_interceptor.dart' as _i908;
import '../network/dio_client.dart' as _i667;
import '../router/app_router.dart' as _i81;
import '../storage/secure_storage.dart' as _i619;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i619.SecureStorage>(() => _i619.SecureStorage());
    gh.lazySingleton<_i908.AuthInterceptor>(
      () => _i908.AuthInterceptor(gh<_i619.SecureStorage>()),
    );
    gh.lazySingleton<_i667.DioClient>(
      () => _i667.DioClient(
        gh<_i908.AuthInterceptor>(),
        gh<_i619.SecureStorage>(),
      ),
    );
    gh.lazySingleton<_i324.GroupRepository>(
      () => _i335.GroupRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i263.RoleRepository>(
      () => _i176.RoleRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i749.CourseRepository>(
      () => _i657.CourseRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i839.OnlineCourseRepository>(
      () => _i211.OnlineCourseRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i477.AttendanceRepository>(
      () => _i719.AttendanceRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i462.PermissionRepository>(
      () => _i996.PermissionRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i760.UserRepository>(
      () => _i738.UserRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i71.LessonSessionRepository>(
      () => _i775.LessonSessionRepositoryImpl(gh<_i667.DioClient>()),
    );
    gh.lazySingleton<_i725.AuthNotifier>(
      () => _i725.AuthNotifier(
        gh<_i787.AuthRepository>(),
        gh<_i619.SecureStorage>(),
      ),
    );
    gh.lazySingleton<_i81.AppRouter>(
      () => _i81.AppRouter(gh<_i619.SecureStorage>(), gh<_i725.AuthNotifier>()),
    );
    return this;
  }
}
