// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupResponseImpl _$$GroupResponseImplFromJson(Map<String, dynamic> json) =>
    _$GroupResponseImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      courseId: json['courseId'] as String,
      courseName: json['courseName'] as String,
      teacher: TeacherInfoResponse.fromJson(
        json['teacher'] as Map<String, dynamic>,
      ),
      capacity: (json['capacity'] as num).toInt(),
      scheduleType: json['scheduleType'] as String,
      scheduleDays:
          (json['scheduleDays'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      active: json['active'] as bool,
      currentStudents: (json['currentStudents'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$GroupResponseImplToJson(_$GroupResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'courseId': instance.courseId,
      'courseName': instance.courseName,
      'teacher': instance.teacher,
      'capacity': instance.capacity,
      'scheduleType': instance.scheduleType,
      'scheduleDays': instance.scheduleDays,
      'active': instance.active,
      'currentStudents': instance.currentStudents,
      'status': instance.status,
    };
