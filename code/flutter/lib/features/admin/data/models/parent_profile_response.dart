import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/data/models/auth_me.dart';

part 'parent_profile_response.freezed.dart';
part 'parent_profile_response.g.dart';

@freezed
class ParentProfileResponse with _$ParentProfileResponse {
  const ParentProfileResponse._();

  const factory ParentProfileResponse({
    required AuthMe baseData,
    @Default(0) int studentsCount,
  }) = _ParentProfileResponse;

  factory ParentProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ParentProfileResponseFromJson(json);

  String get fullName => baseData.fullName;
}
