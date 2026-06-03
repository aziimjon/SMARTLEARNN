import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/online_course_enrollment_response.dart';
import '../../data/models/online_course_response.dart';
import '../../data/models/online_course_summary_response.dart';

abstract class OnlineCourseRepository {
  // ── Courses ───────────────────────────────────────────────────────────────

  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseSummaryResponse>>>>
      getCourses({
    int page = 1,
    int size = 10,
    String? search,
    String? level,
    String? status,
    String? createdById,
    int? minDuration,
    int? maxDuration,
  });

  Future<Either<Failure, OnlineCourseResponse>> getCourse(String courseId);

  Future<Either<Failure, OnlineCourseResponse>> createCourse({
    required String title,
    String? slug,
    String? shortDescription,
    String? description,
    required String level,
    String? status,
    String? unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
  });

  Future<Either<Failure, OnlineCourseResponse>> updateCourse(
    String courseId, {
    required String title,
    String? slug,
    String? shortDescription,
    String? description,
    required String level,
    required String status,
    required String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
  });

  Future<Either<Failure, void>> deleteCourse(String courseId);

  // ── Modules ───────────────────────────────────────────────────────────────

  Future<Either<Failure, void>> addModule(
    String courseId, {
    required String title,
    String? description,
    required int orderIndex,
    String? status,
    String? availableFrom,
  });

  Future<Either<Failure, void>> updateModule(
    String moduleId, {
    required String title,
    String? description,
    required int orderIndex,
    required String status,
    String? availableFrom,
  });

  Future<Either<Failure, void>> deleteModule(String moduleId);

  // ── Lessons ───────────────────────────────────────────────────────────────

  Future<Either<Failure, void>> addLesson(
    String moduleId, {
    required String title,
    String? description,
    String? content,
    required int orderIndex,
    int? durationInMinutes,
    bool freePreview = false,
    String? status,
    String? availableFrom,
    String? videoAttachmentId,
  });

  Future<Either<Failure, void>> updateLesson(
    String lessonId, {
    required String title,
    String? description,
    String? content,
    required int orderIndex,
    int? durationInMinutes,
    bool freePreview = false,
    required String status,
    String? availableFrom,
    String? videoAttachmentId,
  });

  Future<Either<Failure, void>> deleteLesson(String lessonId);

  // ── Materials ─────────────────────────────────────────────────────────────

  Future<Either<Failure, void>> addMaterial(
    String lessonId, {
    required String attachmentId,
    String? title,
    required int orderIndex,
  });

  Future<Either<Failure, void>> updateMaterial(
    String materialId, {
    required String attachmentId,
    String? title,
    required int orderIndex,
  });

  Future<Either<Failure, void>> deleteMaterial(String materialId);

  // ── Enrollments ───────────────────────────────────────────────────────────

  Future<Either<Failure, OnlineCourseEnrollmentResponse>> enrollMe(
      String courseId);

  Future<Either<Failure, OnlineCourseEnrollmentResponse>> enrollStudent(
    String courseId, {
    required String studentProfileId,
    String? status,
  });

  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>>>
      getMyEnrollments({
    int page = 1,
    int size = 10,
    String? status,
  });

  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>>>
      getAllEnrollments({
    int page = 1,
    int size = 10,
    String? courseId,
    String? studentProfileId,
    String? status,
  });

  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>>>
      getStudentEnrollments(
    String studentProfileId, {
    int page = 1,
    int size = 10,
    String? status,
  });

  // ── Progress ──────────────────────────────────────────────────────────────

  Future<Either<Failure, OnlineCourseEnrollmentResponse>> updateLessonProgress(
    String lessonId, {
    required String status,
    int? lastPositionInSeconds,
  });
}
