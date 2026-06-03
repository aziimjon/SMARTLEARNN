// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseResponseImpl _$$OnlineCourseResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OnlineCourseResponseImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  slug: json['slug'] as String,
  shortDescription: json['shortDescription'] as String?,
  description: json['description'] as String?,
  level: json['level'] as String,
  status: json['status'] as String,
  unlockStrategy: json['unlockStrategy'] as String,
  estimatedDurationInMinutes: (json['estimatedDurationInMinutes'] as num?)
      ?.toInt(),
  thumbnailId: json['thumbnailId'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  createdById: json['createdById'] as String?,
  createdByName: json['createdByName'] as String?,
  modules:
      (json['modules'] as List<dynamic>?)
          ?.map(
            (e) =>
                OnlineCourseModuleResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OnlineCourseResponseImplToJson(
  _$OnlineCourseResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'shortDescription': instance.shortDescription,
  'description': instance.description,
  'level': instance.level,
  'status': instance.status,
  'unlockStrategy': instance.unlockStrategy,
  'estimatedDurationInMinutes': instance.estimatedDurationInMinutes,
  'thumbnailId': instance.thumbnailId,
  'thumbnailUrl': instance.thumbnailUrl,
  'createdById': instance.createdById,
  'createdByName': instance.createdByName,
  'modules': instance.modules,
};
