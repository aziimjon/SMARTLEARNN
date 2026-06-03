// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_lesson_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseLessonResponseImpl _$$OnlineCourseLessonResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OnlineCourseLessonResponseImpl(
  id: json['id'] as String,
  moduleId: json['moduleId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  content: json['content'] as String?,
  orderIndex: (json['orderIndex'] as num).toInt(),
  durationInMinutes: (json['durationInMinutes'] as num?)?.toInt(),
  freePreview: json['freePreview'] as bool? ?? false,
  status: json['status'] as String,
  availableFrom: json['availableFrom'] as String?,
  videoAttachmentId: json['videoAttachmentId'] as String?,
  videoUrl: json['videoUrl'] as String?,
  materials:
      (json['materials'] as List<dynamic>?)
          ?.map(
            (e) => OnlineCourseLessonMaterialResponse.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OnlineCourseLessonResponseImplToJson(
  _$OnlineCourseLessonResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'moduleId': instance.moduleId,
  'title': instance.title,
  'description': instance.description,
  'content': instance.content,
  'orderIndex': instance.orderIndex,
  'durationInMinutes': instance.durationInMinutes,
  'freePreview': instance.freePreview,
  'status': instance.status,
  'availableFrom': instance.availableFrom,
  'videoAttachmentId': instance.videoAttachmentId,
  'videoUrl': instance.videoUrl,
  'materials': instance.materials,
};
