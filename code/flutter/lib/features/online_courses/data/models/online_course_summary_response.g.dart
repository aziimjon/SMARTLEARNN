// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseSummaryResponseImpl _$$OnlineCourseSummaryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OnlineCourseSummaryResponseImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  slug: json['slug'] as String,
  shortDescription: json['shortDescription'] as String?,
  level: json['level'] as String,
  status: json['status'] as String,
  unlockStrategy: json['unlockStrategy'] as String,
  estimatedDurationInMinutes: (json['estimatedDurationInMinutes'] as num?)
      ?.toInt(),
  thumbnailId: json['thumbnailId'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
);

Map<String, dynamic> _$$OnlineCourseSummaryResponseImplToJson(
  _$OnlineCourseSummaryResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'slug': instance.slug,
  'shortDescription': instance.shortDescription,
  'level': instance.level,
  'status': instance.status,
  'unlockStrategy': instance.unlockStrategy,
  'estimatedDurationInMinutes': instance.estimatedDurationInMinutes,
  'thumbnailId': instance.thumbnailId,
  'thumbnailUrl': instance.thumbnailUrl,
};
