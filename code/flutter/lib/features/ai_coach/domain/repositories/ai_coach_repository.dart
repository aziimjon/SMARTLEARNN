import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/ai_message.dart';

abstract class AiCoachRepository {
  Future<Either<Failure, String>> sendMessage({
    required String message,
    required List<AiMessage> history,
    String locale,
  });
}
