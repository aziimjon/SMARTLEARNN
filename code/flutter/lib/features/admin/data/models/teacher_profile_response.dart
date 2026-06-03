import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/auth_me.dart';

part 'teacher_profile_response.freezed.dart';
part 'teacher_profile_response.g.dart';

@freezed
class TeacherProfileResponse with _$TeacherProfileResponse {
  const TeacherProfileResponse._();

  const factory TeacherProfileResponse({
    required String teacherId,
    required AuthMe user,
    String? position,
  }) = _TeacherProfileResponse;

  factory TeacherProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$TeacherProfileResponseFromJson(json);

  String get fullName => user.fullName;
}
