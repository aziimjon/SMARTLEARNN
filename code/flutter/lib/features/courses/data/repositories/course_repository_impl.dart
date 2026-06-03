import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/course_repository.dart';
import '../models/course_response.dart';
import '../models/course_section_response.dart';
import '../models/lesson_response.dart';

@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final DioClient _dioClient;

  CourseRepositoryImpl(this._dioClient);

  String _err(DioException e) => e.response?.data is Map
      ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
      : 'Ошибка сети';

  // ── READ ──────────────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, ApiPaginateResponse<List<CourseResponse>>>> getCourses({
    int page = 1,
    int size = 10,
    String? search,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        if (search != null && search.isNotEmpty) 'search': search,
      };
      final response = await _dioClient.dio.get(
        ApiConstants.courses,
        queryParameters: params,
      );
      return Right(ApiPaginateResponse<List<CourseResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => CourseResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, CourseResponse>> getCourse(String id) async {
    try {
      final response = await _dioClient.dio.get('${ApiConstants.courses}/$id');
      return Right(ApiResponse<CourseResponse>.fromJson(
        response.data,
        (json) => CourseResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, CourseSectionResponse>> getCourseSection(String id) async {
    try {
      final response = await _dioClient.dio.get('${ApiConstants.courseSections}/$id');
      return Right(ApiResponse<CourseSectionResponse>.fromJson(
        response.data,
        (json) => CourseSectionResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, LessonResponse>> getLesson(String id) async {
    try {
      final response = await _dioClient.dio.get('${ApiConstants.lessons}/$id');
      return Right(ApiResponse<LessonResponse>.fromJson(
        response.data,
        (json) => LessonResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, ApiPaginateResponse<List<CourseSectionResponse>>>> getSections({
    required String courseId,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.courseSections,
        queryParameters: {'courseId': courseId, 'page': page, 'size': size},
      );
      return Right(ApiPaginateResponse<List<CourseSectionResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => CourseSectionResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, ApiPaginateResponse<List<LessonResponse>>>> getLessons({
    required String sectionId,
    int page = 1,
    int size = 50,
  }) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.lessons,
        queryParameters: {'sectionId': sectionId, 'page': page, 'size': size},
      );
      return Right(ApiPaginateResponse<List<LessonResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) => LessonResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      ));
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── COURSE CRUD ───────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, CourseResponse>> createCourse({
    required String title,
    String? description,
    required String level,
    required int durationInMinutes,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.courses,
        data: {
          'title': title,
          if (description != null) 'description': description,
          'level': level,
          'durationInMinutes': durationInMinutes,
        },
      );
      return Right(ApiResponse<CourseResponse>.fromJson(
        response.data,
        (json) => CourseResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, CourseResponse>> updateCourse(
    String id, {
    required String title,
    String? description,
    required String level,
    required int durationInMinutes,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '${ApiConstants.courses}/$id',
        data: {
          'title': title,
          if (description != null) 'description': description,
          'level': level,
          'durationInMinutes': durationInMinutes,
        },
      );
      return Right(ApiResponse<CourseResponse>.fromJson(
        response.data,
        (json) => CourseResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) async {
    try {
      await _dioClient.dio.delete('${ApiConstants.courses}/$id');
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── SECTION CRUD ──────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, CourseSectionResponse>> createSection({
    required String title,
    required String courseId,
    required int orderIndex,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.courseSections,
        data: {'title': title, 'courseId': courseId, 'orderIndex': orderIndex},
      );
      return Right(ApiResponse<CourseSectionResponse>.fromJson(
        response.data,
        (json) => CourseSectionResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, CourseSectionResponse>> updateSection(
    String id, {
    required String title,
    required int orderIndex,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '${ApiConstants.courseSections}/$id',
        data: {'title': title, 'orderIndex': orderIndex},
      );
      return Right(ApiResponse<CourseSectionResponse>.fromJson(
        response.data,
        (json) => CourseSectionResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSection(String id) async {
    try {
      await _dioClient.dio.delete('${ApiConstants.courseSections}/$id');
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  // ── LESSON CRUD ───────────────────────────────────────────────────────────

  @override
  Future<Either<Failure, LessonResponse>> createLesson({
    required String title,
    String? content,
    required int durationInMinutes,
    required String sectionId,
  }) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.lessons,
        data: {
          'title': title,
          if (content != null && content.isNotEmpty) 'content': content,
          'durationInMinutes': durationInMinutes,
          'sectionId': sectionId,
        },
      );
      return Right(ApiResponse<LessonResponse>.fromJson(
        response.data,
        (json) => LessonResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, LessonResponse>> updateLesson(
    String id, {
    required String title,
    String? content,
    required int durationInMinutes,
  }) async {
    try {
      final response = await _dioClient.dio.put(
        '${ApiConstants.lessons}/$id',
        data: {
          'title': title,
          if (content != null && content.isNotEmpty) 'content': content,
          'durationInMinutes': durationInMinutes,
        },
      );
      return Right(ApiResponse<LessonResponse>.fromJson(
        response.data,
        (json) => LessonResponse.fromJson(json as Map<String, dynamic>),
      ).data);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }

  @override
  Future<Either<Failure, void>> deleteLesson(String id) async {
    try {
      await _dioClient.dio.delete('${ApiConstants.lessons}/$id');
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(_err(e)));
    }
  }
}
