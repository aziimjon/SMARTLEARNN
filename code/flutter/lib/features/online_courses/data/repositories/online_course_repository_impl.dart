import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/online_course_repository.dart';
import '../models/online_course_enrollment_response.dart';
import '../models/online_course_response.dart';
import '../models/online_course_summary_response.dart';

@LazySingleton(as: OnlineCourseRepository)
class OnlineCourseRepositoryImpl implements OnlineCourseRepository {
  final DioClient _dioClient;

  OnlineCourseRepositoryImpl(this._dioClient);

  String _err(DioException e) => e.response?.data is Map
      ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
      : 'Ошибка сети';

  // ── Courses ───────────────────────────────────────────────────────────────

  @override
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
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        if (search != null && search.isNotEmpty) 'search': search,
        if (level != null) 'level': level,
        if (status != null) 'status': status,
        if (createdById != null) 'createdById': createdById,
        if (minDuration != null) 'minDuration': minDuration,
        if (maxDuration != null) 'maxDuration': maxDuration,
      };
      final response = await _dioClient.dio
          .get(ApiConstants.onlineCourses, queryParameters: params);
      return Right(
        ApiPaginateResponse<List<OnlineCourseSummaryResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) =>
                  OnlineCourseSummaryResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, OnlineCourseResponse>> getCourse(
      String courseId) async {
    try {
      final response =
          await _dioClient.dio.get(ApiConstants.onlineCourse(courseId));
      return Right(ApiResponse<OnlineCourseResponse>.fromJson(
        response.data,
        (json) =>
            OnlineCourseResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.onlineCourses,
        data: {
          'title': title,
          if (slug != null) 'slug': slug,
          if (shortDescription != null) 'shortDescription': shortDescription,
          if (description != null) 'description': description,
          'level': level,
          if (status != null) 'status': status,
          if (unlockStrategy != null) 'unlockStrategy': unlockStrategy,
          if (estimatedDurationInMinutes != null)
            'estimatedDurationInMinutes': estimatedDurationInMinutes,
          if (thumbnailId != null) 'thumbnailId': thumbnailId,
        },
      );
      return Right(ApiResponse<OnlineCourseResponse>.fromJson(
        response.data,
        (json) =>
            OnlineCourseResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      final response = await _dioClient.dio.put(
        ApiConstants.onlineCourse(courseId),
        data: {
          'title': title,
          if (slug != null) 'slug': slug,
          if (shortDescription != null) 'shortDescription': shortDescription,
          if (description != null) 'description': description,
          'level': level,
          'status': status,
          'unlockStrategy': unlockStrategy,
          if (estimatedDurationInMinutes != null)
            'estimatedDurationInMinutes': estimatedDurationInMinutes,
          if (thumbnailId != null) 'thumbnailId': thumbnailId,
        },
      );
      return Right(ApiResponse<OnlineCourseResponse>.fromJson(
        response.data,
        (json) =>
            OnlineCourseResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String courseId) async {
    try {
      await _dioClient.dio.delete(ApiConstants.onlineCourse(courseId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Modules ───────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, void>> addModule(
    String courseId, {
    required String title,
    String? description,
    required int orderIndex,
    String? status,
    String? availableFrom,
  }) async {
    try {
      await _dioClient.dio.post(
        ApiConstants.onlineCourseModules(courseId),
        data: {
          'title': title,
          if (description != null) 'description': description,
          'orderIndex': orderIndex,
          if (status != null) 'status': status,
          if (availableFrom != null) 'availableFrom': availableFrom,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> updateModule(
    String moduleId, {
    required String title,
    String? description,
    required int orderIndex,
    required String status,
    String? availableFrom,
  }) async {
    try {
      await _dioClient.dio.put(
        ApiConstants.onlineCourseModule(moduleId),
        data: {
          'title': title,
          if (description != null) 'description': description,
          'orderIndex': orderIndex,
          'status': status,
          if (availableFrom != null) 'availableFrom': availableFrom,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteModule(String moduleId) async {
    try {
      await _dioClient.dio
          .delete(ApiConstants.onlineCourseModule(moduleId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Lessons ───────────────────────────────────────────────────────────────

  @override
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
  }) async {
    try {
      await _dioClient.dio.post(
        ApiConstants.onlineCourseModuleLessons(moduleId),
        data: {
          'title': title,
          if (description != null) 'description': description,
          if (content != null) 'content': content,
          'orderIndex': orderIndex,
          if (durationInMinutes != null) 'durationInMinutes': durationInMinutes,
          'freePreview': freePreview,
          if (status != null) 'status': status,
          if (availableFrom != null) 'availableFrom': availableFrom,
          if (videoAttachmentId != null) 'videoAttachmentId': videoAttachmentId,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
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
  }) async {
    try {
      await _dioClient.dio.put(
        ApiConstants.onlineCourseLesson(lessonId),
        data: {
          'title': title,
          if (description != null) 'description': description,
          if (content != null) 'content': content,
          'orderIndex': orderIndex,
          if (durationInMinutes != null) 'durationInMinutes': durationInMinutes,
          'freePreview': freePreview,
          'status': status,
          if (availableFrom != null) 'availableFrom': availableFrom,
          if (videoAttachmentId != null) 'videoAttachmentId': videoAttachmentId,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLesson(String lessonId) async {
    try {
      await _dioClient.dio
          .delete(ApiConstants.onlineCourseLesson(lessonId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Materials ─────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, void>> addMaterial(
    String lessonId, {
    required String attachmentId,
    String? title,
    required int orderIndex,
  }) async {
    try {
      await _dioClient.dio.post(
        ApiConstants.onlineCourseLessonMaterials(lessonId),
        data: {
          'attachmentId': attachmentId,
          if (title != null) 'title': title,
          'orderIndex': orderIndex,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> updateMaterial(
    String materialId, {
    required String attachmentId,
    String? title,
    required int orderIndex,
  }) async {
    try {
      await _dioClient.dio.put(
        ApiConstants.onlineCourseMaterial(materialId),
        data: {
          'attachmentId': attachmentId,
          if (title != null) 'title': title,
          'orderIndex': orderIndex,
        },
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMaterial(String materialId) async {
    try {
      await _dioClient.dio
          .delete(ApiConstants.onlineCourseMaterial(materialId));
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Enrollments ───────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, OnlineCourseEnrollmentResponse>> enrollMe(
      String courseId) async {
    try {
      final response = await _dioClient.dio
          .post(ApiConstants.onlineCourseEnrollMe(courseId));
      return Right(ApiResponse<OnlineCourseEnrollmentResponse>.fromJson(
        response.data,
        (json) => OnlineCourseEnrollmentResponse.fromJson(
            json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, OnlineCourseEnrollmentResponse>> enrollStudent(
    String courseId, {
    required String studentProfileId,
    String? status,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.onlineCourseEnroll(courseId),
        data: {
          'studentProfileId': studentProfileId,
          if (status != null) 'status': status,
        },
      );
      return Right(ApiResponse<OnlineCourseEnrollmentResponse>.fromJson(
        response.data,
        (json) => OnlineCourseEnrollmentResponse.fromJson(
            json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>>>
      getMyEnrollments({
    int page = 1,
    int size = 10,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        if (status != null) 'status': status,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.onlineCourseEnrollmentsMe,
        queryParameters: params,
      );
      return Right(
        ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) => OnlineCourseEnrollmentResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>>>
      getAllEnrollments({
    int page = 1,
    int size = 10,
    String? courseId,
    String? studentProfileId,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        if (courseId != null) 'courseId': courseId,
        if (studentProfileId != null) 'studentProfileId': studentProfileId,
        if (status != null) 'status': status,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.onlineCourseEnrollments,
        queryParameters: params,
      );
      return Right(
        ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) => OnlineCourseEnrollmentResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>>>
      getStudentEnrollments(
    String studentProfileId, {
    int page = 1,
    int size = 10,
    String? status,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        if (status != null) 'status': status,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.onlineCourseStudentEnrollments(studentProfileId),
        queryParameters: params,
      );
      return Right(
        ApiPaginateResponse<List<OnlineCourseEnrollmentResponse>>.fromJson(
          response.data,
          (json) => (json as List)
              .map((e) => OnlineCourseEnrollmentResponse.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        ),
      );
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── Progress ──────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, OnlineCourseEnrollmentResponse>> updateLessonProgress(
    String lessonId, {
    required String status,
    int? lastPositionInSeconds,
  }) async {
    try {
      final response = await _dioClient.dio.patch(
        ApiConstants.onlineCourseLessonProgress(lessonId),
        data: {
          'status': status,
          if (lastPositionInSeconds != null)
            'lastPositionInSeconds': lastPositionInSeconds,
        },
      );
      return Right(ApiResponse<OnlineCourseEnrollmentResponse>.fromJson(
        response.data,
        (json) => OnlineCourseEnrollmentResponse.fromJson(
            json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }
}
