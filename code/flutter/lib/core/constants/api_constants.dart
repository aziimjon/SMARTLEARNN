class ApiConstants {
  static const String baseUrl = 'http://localhost:8888/api/v1';

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String me = '/auth/me';

  // Courses
  static const String courses = '/courses';
  static const String courseSections = '/course-sections';
  static const String lessons = '/lessons';

  // Groups & sessions
  static const String groups = '/groups';
  static const String lessonSessions = '/lesson-sessions';
  static const String schedules = '/schedules';

  // Attendance
  static const String attendances = '/attendances';
  static const String attendanceNotes = '/attendance-notes';

  // Users & profiles
  static const String users = '/user';
  static const String students = '/student';
  static const String teachers = '/teacher';
  static const String parents = '/parent';
  static String groupStart(String id) => '/groups/$id/start';
  static String groupGenerateSessions(String id) => '/groups/$id/lesson-sessions/generate';

  // Files
  static const String attachments = '/attachments';

  // Online Courses
  static const String onlineCourses = '/online-courses';
  static String onlineCourse(String id) => '/online-courses/$id';
  static String onlineCourseModules(String courseId) =>
      '/online-courses/$courseId/modules';
  static String onlineCourseModule(String moduleId) =>
      '/online-courses/modules/$moduleId';
  static String onlineCourseModuleLessons(String moduleId) =>
      '/online-courses/modules/$moduleId/lessons';
  static String onlineCourseLesson(String lessonId) =>
      '/online-courses/lessons/$lessonId';
  static String onlineCourseLessonMaterials(String lessonId) =>
      '/online-courses/lessons/$lessonId/materials';
  static String onlineCourseMaterial(String materialId) =>
      '/online-courses/materials/$materialId';
  static String onlineCourseEnrollMe(String courseId) =>
      '/online-courses/$courseId/enrollments/me';
  static String onlineCourseEnroll(String courseId) =>
      '/online-courses/$courseId/enrollments';
  static const String onlineCourseEnrollmentsMe =
      '/online-courses/enrollments/me';
  static const String onlineCourseEnrollments = '/online-courses/enrollments';
  static String onlineCourseStudentEnrollments(String studentProfileId) =>
      '/online-courses/students/$studentProfileId/enrollments';
  static String onlineCourseLessonProgress(String lessonId) =>
      '/online-courses/lessons/$lessonId/progress';

  // Roles
  static const String roles = '/roles';
  static String roleById(String id) => '/roles/$id';

  // Permissions
  static const String permissions = '/permissions';
  static String permissionById(String id) => '/permissions/$id';

  // User Roles
  static String userRoles(String userId) => '/user/$userId/roles';
  static String userRoleById(String userId, String roleId) =>
      '/user/$userId/roles/$roleId';

  // Attachment download
  static String attachmentById(String id) => '/attachments/$id';

  // AI Coach
  static const String aiChat = '/ai/chat';
  static const String aiHistory = '/ai/history';
}
