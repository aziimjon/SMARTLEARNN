import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/repositories/lesson_session_repository.dart';
import '../models/lesson_session_response.dart';

@LazySingleton(as: LessonSessionRepository)
class LessonSessionRepositoryImpl implements LessonSessionRepository {
  final DioClient _dioClient;

  LessonSessionRepositoryImpl(this._dioClient);

  static final _fmt = DateFormat("yyyy-MM-dd'T'HH:mm:ss");

  @override
  Future<Either<Failure, ApiPaginateResponse<List<LessonSessionResponse>>>> getLessonSessions({
    String? groupId,
    String? lessonId,
    String? status,
    DateTime? from,
    DateTime? to,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final params = <String, dynamic>{
        'page': page,
        'size': size,
        'groupId': ?groupId,
        'lessonId': ?lessonId,
        'status': ?status,
        if (from != null) 'from': _fmt.format(from),
        if (to != null) 'to': _fmt.format(to),
      };
      final response = await _dioClient.dio.get(
        ApiConstants.lessonSessions,
        queryParameters: params,
      );
      final result = ApiPaginateResponse<List<LessonSessionResponse>>.fromJson(
        response.data,
        (json) => (json as List)
            .map((e) =>
                LessonSessionResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
      return Right(result);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
          : 'Ошибка сети';
      return Left(ServerFailure(message));
    }
  }

  @override
  Future<Either<Failure, LessonSessionResponse>> getLessonSession(
      String id) async {
    try {
      final response =
          await _dioClient.dio.get('${ApiConstants.lessonSessions}/$id');
      final result = ApiResponse<LessonSessionResponse>.fromJson(
        response.data,
        (json) =>
            LessonSessionResponse.fromJson(json as Map<String, dynamic>),
      );
      return Right(result.data);
    } on DioException catch (e) {
      final message = e.response?.data is Map
          ? e.response!.data['message'] as String? ?? 'Ошибка сервера'
          : 'Ошибка сети';
      return Left(ServerFailure(message));
    }
  }
}
