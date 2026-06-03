// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonResponseImpl _$$LessonResponseImplFromJson(Map<String, dynamic> json) =>
    _$LessonResponseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String?,
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      sectionId: json['sectionId'] as String,
    );

Map<String, dynamic> _$$LessonResponseImplToJson(
  _$LessonResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'durationInMinutes': instance.durationInMinutes,
  'sectionId': instance.sectionId,
};
