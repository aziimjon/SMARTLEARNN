// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseResponseImpl _$$CourseResponseImplFromJson(Map<String, dynamic> json) =>
    _$CourseResponseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      level: json['level'] as String,
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map(
                (e) =>
                    CourseSectionResponse.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CourseResponseImplToJson(
  _$CourseResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'level': instance.level,
  'durationInMinutes': instance.durationInMinutes,
  'sections': instance.sections,
};
