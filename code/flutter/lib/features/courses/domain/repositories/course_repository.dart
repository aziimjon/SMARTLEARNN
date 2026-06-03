import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/course_response.dart';
import '../../data/models/course_section_response.dart';
import '../../data/models/lesson_response.dart';

abstract class CourseRepository {
  // ── READ ──────────────────────────────────────────────────────────────────
  Future<Either<Failure, ApiPaginateResponse<List<CourseResponse>>>> getCourses({
    int page = 1,
    int size = 10,
    String? search,
  });

  Future<Either<Failure, CourseResponse>> getCourse(String id);

  Future<Either<Failure, CourseSectionResponse>> getCourseSection(String id);

  Future<Either<Failure, LessonResponse>> getLesson(String id);

  Future<Either<Failure, ApiPaginateResponse<List<CourseSectionResponse>>>> getSections({
    required String courseId,
    int page = 1,
    int size = 50,
  });

  Future<Either<Failure, ApiPaginateResponse<List<LessonResponse>>>> getLessons({
    required String sectionId,
    int page = 1,
    int size = 50,
  });

  // ── COURSE CRUD ───────────────────────────────────────────────────────────
  Future<Either<Failure, CourseResponse>> createCourse({
    required String title,
    String? description,
    required String level,
    required int durationInMinutes,
  });

  Future<Either<Failure, CourseResponse>> updateCourse(
    String id, {
    required String title,
    String? description,
    required String level,
    required int durationInMinutes,
  });

  Future<Either<Failure, void>> deleteCourse(String id);

  // ── SECTION CRUD ──────────────────────────────────────────────────────────
  Future<Either<Failure, CourseSectionResponse>> createSection({
    required String title,
    required String courseId,
    required int orderIndex,
  });

  Future<Either<Failure, CourseSectionResponse>> updateSection(
    String id, {
    required String title,
    required int orderIndex,
  });

  Future<Either<Failure, void>> deleteSection(String id);

  // ── LESSON CRUD ───────────────────────────────────────────────────────────
  Future<Either<Failure, LessonResponse>> createLesson({
    required String title,
    String? content,
    required int durationInMinutes,
    required String sectionId,
  });

  Future<Either<Failure, LessonResponse>> updateLesson(
    String id, {
    required String title,
    String? content,
    required int durationInMinutes,
  });

  Future<Either<Failure, void>> deleteLesson(String id);
}
