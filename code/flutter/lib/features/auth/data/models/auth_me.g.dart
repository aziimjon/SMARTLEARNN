// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthMeImpl _$$AuthMeImplFromJson(Map<String, dynamic> json) => _$AuthMeImpl(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  middleName: json['middleName'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  gender: json['gender'] as String?,
  status: json['status'] as String,
  birthDate: json['birthDate'] as String?,
  profileImageAttachmentId: json['profileImageAttachmentId'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  profileBackgroundAttachmentId:
      json['profileBackgroundAttachmentId'] as String?,
  profileBackgroundUrl: json['profileBackgroundUrl'] as String?,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AuthMeImplToJson(_$AuthMeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'gender': instance.gender,
      'status': instance.status,
      'birthDate': instance.birthDate,
      'profileImageAttachmentId': instance.profileImageAttachmentId,
      'profileImageUrl': instance.profileImageUrl,
      'profileBackgroundAttachmentId': instance.profileBackgroundAttachmentId,
      'profileBackgroundUrl': instance.profileBackgroundUrl,
      'roles': instance.roles,
    };
