// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_lesson_material_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseLessonMaterialResponseImpl
_$$OnlineCourseLessonMaterialResponseImplFromJson(Map<String, dynamic> json) =>
    _$OnlineCourseLessonMaterialResponseImpl(
      id: json['id'] as String,
      lessonId: json['lessonId'] as String,
      attachmentId: json['attachmentId'] as String,
      attachmentUrl: json['attachmentUrl'] as String?,
      title: json['title'] as String?,
      orderIndex: (json['orderIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$OnlineCourseLessonMaterialResponseImplToJson(
  _$OnlineCourseLessonMaterialResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'lessonId': instance.lessonId,
  'attachmentId': instance.attachmentId,
  'attachmentUrl': instance.attachmentUrl,
  'title': instance.title,
  'orderIndex': instance.orderIndex,
};
