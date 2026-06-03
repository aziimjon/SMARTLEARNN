// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeacherInfoResponseImpl _$$TeacherInfoResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TeacherInfoResponseImpl(
  userId: json['userId'] as String,
  teacherId: json['teacherId'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  middleName: json['middleName'] as String?,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  gender: json['gender'] as String?,
  status: json['status'] as String,
  birthDate: json['birthDate'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  profileBackgroundUrl: json['profileBackgroundUrl'] as String?,
);

Map<String, dynamic> _$$TeacherInfoResponseImplToJson(
  _$TeacherInfoResponseImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'teacherId': instance.teacherId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'middleName': instance.middleName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'gender': instance.gender,
  'status': instance.status,
  'birthDate': instance.birthDate,
  'profileImageUrl': instance.profileImageUrl,
  'profileBackgroundUrl': instance.profileBackgroundUrl,
};
