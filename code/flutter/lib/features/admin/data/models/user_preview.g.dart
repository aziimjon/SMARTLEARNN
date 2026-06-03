// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreviewImpl _$$UserPreviewImplFromJson(Map<String, dynamic> json) =>
    _$UserPreviewImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      middleName: json['middleName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      status: json['status'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      profileBackgroundUrl: json['profileBackgroundUrl'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
    );

Map<String, dynamic> _$$UserPreviewImplToJson(_$UserPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'status': instance.status,
      'profileImageUrl': instance.profileImageUrl,
      'profileBackgroundUrl': instance.profileBackgroundUrl,
      'roles': instance.roles,
    };
