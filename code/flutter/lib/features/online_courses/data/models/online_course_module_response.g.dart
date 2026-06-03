// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_module_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseModuleResponseImpl _$$OnlineCourseModuleResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OnlineCourseModuleResponseImpl(
  id: json['id'] as String,
  courseId: json['courseId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  orderIndex: (json['orderIndex'] as num).toInt(),
  status: json['status'] as String,
  availableFrom: json['availableFrom'] as String?,
  lessons:
      (json['lessons'] as List<dynamic>?)
          ?.map(
            (e) =>
                OnlineCourseLessonResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OnlineCourseModuleResponseImplToJson(
  _$OnlineCourseModuleResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'courseId': instance.courseId,
  'title': instance.title,
  'description': instance.description,
  'orderIndex': instance.orderIndex,
  'status': instance.status,
  'availableFrom': instance.availableFrom,
  'lessons': instance.lessons,
};
