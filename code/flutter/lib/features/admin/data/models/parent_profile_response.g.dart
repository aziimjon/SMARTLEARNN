// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParentProfileResponseImpl _$$ParentProfileResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ParentProfileResponseImpl(
  baseData: AuthMe.fromJson(json['baseData'] as Map<String, dynamic>),
  studentsCount: (json['studentsCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$ParentProfileResponseImplToJson(
  _$ParentProfileResponseImpl instance,
) => <String, dynamic>{
  'baseData': instance.baseData,
  'studentsCount': instance.studentsCount,
};
