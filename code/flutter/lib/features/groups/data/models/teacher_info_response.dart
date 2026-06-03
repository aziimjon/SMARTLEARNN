import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher_info_response.freezed.dart';
part 'teacher_info_response.g.dart';

@freezed
class TeacherInfoResponse with _$TeacherInfoResponse {
  const factory TeacherInfoResponse({
    required String userId,
    required String teacherId,
    required String firstName,
    required String lastName,
    String? middleName,
    required String email,
    String? phoneNumber,
    String? gender,
    required String status,
    String? birthDate,
    String? profileImageUrl,
    String? profileBackgroundUrl,
  }) = _TeacherInfoResponse;

  factory TeacherInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$TeacherInfoResponseFromJson(json);
}
