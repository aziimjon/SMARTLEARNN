import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/attendance/presentation/student/attendance_screen.dart';
import '../../features/courses/presentation/student/course_detail_screen.dart';
import '../../features/courses/presentation/student/courses_screen.dart';
import '../../features/courses/presentation/student/lesson_screen.dart';
import '../../features/attendance/presentation/teacher/mark_attendance_screen.dart';
import '../../features/groups/presentation/teacher/group_detail_screen.dart';
import '../../features/groups/presentation/teacher/groups_screen.dart';
import '../../features/admin/presentation/screens/admin_shell.dart';
import '../../features/student/presentation/screens/student_edit_profile_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/student/presentation/screens/student_shell.dart';
import '../../features/online_courses/presentation/screens/my_enrollments_screen.dart';
import '../../features/online_courses/presentation/screens/online_course_detail_screen.dart';
import '../../features/online_courses/presentation/screens/online_courses_screen.dart';
import '../../features/online_courses/presentation/screens/online_lesson_detail_screen.dart';
import '../../features/schedule/presentation/student/schedule_screen.dart';
import '../storage/secure_storage.dart';
import 'routes.dart';

@lazySingleton
class AppRouter {
  final SecureStorage _secureStorage;
  final AuthNotifier _authNotifier;

  AppRouter(this._secureStorage, this._authNotifier);

  late final GoRouter router = GoRouter(
    initialLocation: Routes.login,
    refreshListenable: _authNotifier,
    redirect: _redirect,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // Student routes
      GoRoute(
        path: Routes.studentHome,
        builder: (context, state) => const StudentShell(),
      ),
      GoRoute(
        path: Routes.studentCourses,
        builder: (context, state) => const CoursesScreen(),
      ),
      GoRoute(
        path: '/student/courses/:id',
        builder: (context, state) => CourseDetailScreen(
          courseId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/student/courses/:courseId/lessons/:lessonId',
        builder: (context, state) => LessonScreen(
          courseId: state.pathParameters['courseId']!,
          lessonId: state.pathParameters['lessonId']!,
        ),
      ),
      GoRoute(
        path: Routes.studentSchedule,
        builder: (context, state) => const ScheduleScreen(),
      ),
      GoRoute(
        path: Routes.studentAttendance,
        builder: (context, state) => const AttendanceScreen(),
      ),
      GoRoute(
        path: Routes.studentOnlineCourses,
        builder: (context, state) => const OnlineCoursesScreen(),
      ),
      GoRoute(
        path: '/student/online-courses/:courseId',
        builder: (context, state) => OnlineCourseDetailScreen(
          courseId: state.pathParameters['courseId']!,
        ),
      ),
      GoRoute(
        path: '/student/online-courses/:courseId/lessons/:lessonId',
        builder: (context, state) => OnlineLessonDetailScreen(
          courseId: state.pathParameters['courseId']!,
          lessonId: state.pathParameters['lessonId']!,
          lessonTitle: state.uri.queryParameters['title'] ?? 'Урок',
        ),
      ),
      GoRoute(
        path: Routes.studentMyEnrollments,
        builder: (context, state) => const MyEnrollmentsScreen(),
      ),

      GoRoute(
        path: Routes.studentEditProfile,
        builder: (context, state) => const StudentEditProfileScreen(),
      ),

      // Teacher routes
      GoRoute(
        path: Routes.teacherHome,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.teacherGroups,
        builder: (context, state) => const GroupsScreen(),
      ),
      GoRoute(
        path: '/teacher/groups/:id',
        builder: (context, state) => GroupDetailScreen(
          groupId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/teacher/sessions/:sessionId/attendance',
        builder: (context, state) => MarkAttendanceScreen(
          sessionId: state.pathParameters['sessionId']!,
        ),
      ),

      // Admin routes
      GoRoute(
        path: Routes.adminHome,
        builder: (context, state) => const AdminShell(),
      ),
    ],
  );

  Future<String?> _redirect(BuildContext context, GoRouterState state) async {
    final token = await _secureStorage.getToken();

    if (token == null) {
      return state.matchedLocation == Routes.login ? null : Routes.login;
    }

    final user = _authNotifier.user;
    if (user == null) {
      return state.matchedLocation == Routes.login ? null : Routes.login;
    }

    if (state.matchedLocation == Routes.login) {
      if (user.isAdmin) return Routes.adminHome;
      if (user.isTeacher) return Routes.teacherHome;
      return Routes.studentHome;
    }

    return null;
  }
}