// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherProfileResponseImpl _$$TeacherProfileResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TeacherProfileResponseImpl(
  teacherId: json['teacherId'] as String,
  user: AuthMe.fromJson(json['user'] as Map<String, dynamic>),
  position: json['position'] as String?,
);

Map<String, dynamic> _$$TeacherProfileResponseImplToJson(
  _$TeacherProfileResponseImpl instance,
) => <String, dynamic>{
  'teacherId': instance.teacherId,
  'user': instance.user,
  'position': instance.position,
};
