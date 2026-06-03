import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/auth_me.dart';

part 'student_profile_response.freezed.dart';
part 'student_profile_response.g.dart';

@freezed
class StudentProfileResponse with _$StudentProfileResponse {
  const StudentProfileResponse._();

  const factory StudentProfileResponse({
    required AuthMe baseData,
    String? studentId,
    String? status,
  }) = _StudentProfileResponse;

  factory StudentProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentProfileResponseFromJson(json);

  String get fullName => baseData.fullName;
}
