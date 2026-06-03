// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentProfileResponseImpl _$$StudentProfileResponseImplFromJson(
  Map<String, dynamic> json,
) => _$StudentProfileResponseImpl(
  baseData: AuthMe.fromJson(json['baseData'] as Map<String, dynamic>),
  studentId: json['studentId'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$$StudentProfileResponseImplToJson(
  _$StudentProfileResponseImpl instance,
) => <String, dynamic>{
  'baseData': instance.baseData,
  'studentId': instance.studentId,
  'status': instance.status,
};
