// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_enrollment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OnlineCourseEnrollmentResponseImpl
_$$OnlineCourseEnrollmentResponseImplFromJson(Map<String, dynamic> json) =>
    _$OnlineCourseEnrollmentResponseImpl(
      id: json['id'] as String,
      course: OnlineCourseSummaryResponse.fromJson(
        json['course'] as Map<String, dynamic>,
      ),
      studentProfileId: json['studentProfileId'] as String,
      studentUserId: json['studentUserId'] as String,
      studentName: json['studentName'] as String,
      openedById: json['openedById'] as String?,
      status: json['status'] as String,
      openedAt: json['openedAt'] as String,
      completedAt: json['completedAt'] as String?,
      currentModuleId: json['currentModuleId'] as String?,
      currentLessonId: json['currentLessonId'] as String?,
      completedLessons: (json['completedLessons'] as num?)?.toInt() ?? 0,
      totalLessons: (json['totalLessons'] as num?)?.toInt() ?? 0,
      progressPercentage:
          (json['progressPercentage'] as num?)?.toDouble() ?? 0.0,
      moduleProgresses:
          (json['moduleProgresses'] as List<dynamic>?)
              ?.map(
                (e) => OnlineCourseProgressResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
      lessonProgresses:
          (json['lessonProgresses'] as List<dynamic>?)
              ?.map(
                (e) => OnlineCourseProgressResponse.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$OnlineCourseEnrollmentResponseImplToJson(
  _$OnlineCourseEnrollmentResponseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'course': instance.course,
  'studentProfileId': instance.studentProfileId,
  'studentUserId': instance.studentUserId,
  'studentName': instance.studentName,
  'openedById': instance.openedById,
  'status': instance.status,
  'openedAt': instance.openedAt,
  'completedAt': instance.completedAt,
  'currentModuleId': instance.currentModuleId,
  'currentLessonId': instance.currentLessonId,
  'completedLessons': instance.completedLessons,
  'totalLessons': instance.totalLessons,
  'progressPercentage': instance.progressPercentage,
  'moduleProgresses': instance.moduleProgresses,
  'lessonProgresses': instance.lessonProgresses,
};
