// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_section_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseSectionResponseImpl _$$CourseSectionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$CourseSectionResponseImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  orderIndex: (json['orderIndex'] as num).toInt(),
  courseId: json['courseId'] as String,
  lessons:
      (json['lessons'] as List<dynamic>?)
          ?.map((e) => LessonResponse.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$CourseSectionResponseImplToJson(
  _$CourseSectionResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'orderIndex': instance.orderIndex,
  'courseId': instance.courseId,
  'lessons': instance.lessons,
};
