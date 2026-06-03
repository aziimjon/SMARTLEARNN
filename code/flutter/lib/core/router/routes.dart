class Routes {
  static const String login = '/login';

  // Student
  static const String studentHome = '/student/home';
  static const String studentCourses = '/student/courses';
  static String studentCourseDetail(String id) => '/student/courses/$id';
  static String studentLesson(String courseId, String lessonId) =>
      '/student/courses/$courseId/lessons/$lessonId';

  static const String studentSchedule = '/student/schedule';
  static const String studentAttendance = '/student/attendance';

  // Student — Online Courses
  static const String studentOnlineCourses = '/student/online-courses';
  static String studentOnlineCourseDetail(String courseId) =>
      '/student/online-courses/$courseId';
  static String studentOnlineLessonDetail(String courseId, String lessonId) =>
      '/student/online-courses/$courseId/lessons/$lessonId';
  static const String studentMyEnrollments = '/student/my-courses';

  // Teacher
  static const String teacherHome = '/teacher/home';
  static const String teacherGroups = '/teacher/groups';
  static String teacherGroupDetail(String id) => '/teacher/groups/$id';
  static String teacherMarkAttendance(String sessionId) =>
      '/teacher/sessions/$sessionId/attendance';

  // Student profile
  static const String studentEditProfile = '/student/profile/edit';

  // Admin
  static const String adminHome = '/admin/home';
}
