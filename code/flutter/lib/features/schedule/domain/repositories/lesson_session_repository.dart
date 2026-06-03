import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_response.dart';
import '../../data/models/lesson_session_response.dart';

abstract class LessonSessionRepository {
  Future<Either<Failure, ApiPaginateResponse<List<LessonSessionResponse>>>> getLessonSessions({
    String? groupId,
    String? lessonId,
    String? status,
    DateTime? from,
    DateTime? to,
    int page = 1,
    int size = 20,
  });

  Future<Either<Failure, LessonSessionResponse>> getLessonSession(String id);
}
