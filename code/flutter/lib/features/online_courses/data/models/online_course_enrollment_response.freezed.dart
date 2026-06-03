// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_course_enrollment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OnlineCourseEnrollmentResponse _$OnlineCourseEnrollmentResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OnlineCourseEnrollmentResponse.fromJson(json);
}

/// @nodoc
mixin _$OnlineCourseEnrollmentResponse {
  String get id => throw _privateConstructorUsedError;
  OnlineCourseSummaryResponse get course => throw _privateConstructorUsedError;
  String get studentProfileId => throw _privateConstructorUsedError;
  String get studentUserId => throw _privateConstructorUsedError;
  String get studentName => throw _privateConstructorUsedError;
  String? get openedById => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get openedAt => throw _privateConstructorUsedError;
  String? get completedAt => throw _privateConstructorUsedError;
  String? get currentModuleId => throw _privateConstructorUsedError;
  String? get currentLessonId => throw _privateConstructorUsedError;
  int get completedLessons => throw _privateConstructorUsedError;
  int get totalLessons => throw _privateConstructorUsedError;
  double get progressPercentage => throw _privateConstructorUsedError;
  List<OnlineCourseProgressResponse> get moduleProgresses =>
      throw _privateConstructorUsedError;
  List<OnlineCourseProgressResponse> get lessonProgresses =>
      throw _privateConstructorUsedError;

  /// Serializes this OnlineCourseEnrollmentResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineCourseEnrollmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineCourseEnrollmentResponseCopyWith<OnlineCourseEnrollmentResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineCourseEnrollmentResponseCopyWith<$Res> {
  factory $OnlineCourseEnrollmentResponseCopyWith(
    OnlineCourseEnrollmentResponse value,
    $Res Function(OnlineCourseEnrollmentResponse) then,
  ) =
      _$OnlineCourseEnrollmentResponseCopyWithImpl<
        $Res,
        OnlineCourseEnrollmentResponse
      >;
  @useResult
  $Res call({
    String id,
    OnlineCourseSummaryResponse course,
    String studentProfileId,
    String studentUserId,
    String studentName,
    String? openedById,
    String status,
    String openedAt,
    String? completedAt,
    String? currentModuleId,
    String? currentLessonId,
    int completedLessons,
    int totalLessons,
    double progressPercentage,
    List<OnlineCourseProgressResponse> moduleProgresses,
    List<OnlineCourseProgressResponse> lessonProgresses,
  });

  $OnlineCourseSummaryResponseCopyWith<$Res> get course;
}

/// @nodoc
class _$OnlineCourseEnrollmentResponseCopyWithImpl<
  $Res,
  $Val extends OnlineCourseEnrollmentResponse
>
    implements $OnlineCourseEnrollmentResponseCopyWith<$Res> {
  _$OnlineCourseEnrollmentResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineCourseEnrollmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? course = null,
    Object? studentProfileId = null,
    Object? studentUserId = null,
    Object? studentName = null,
    Object? openedById = freezed,
    Object? status = null,
    Object? openedAt = null,
    Object? completedAt = freezed,
    Object? currentModuleId = freezed,
    Object? currentLessonId = freezed,
    Object? completedLessons = null,
    Object? totalLessons = null,
    Object? progressPercentage = null,
    Object? moduleProgresses = null,
    Object? lessonProgresses = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            course: null == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                      as OnlineCourseSummaryResponse,
            studentProfileId: null == studentProfileId
                ? _value.studentProfileId
                : studentProfileId // ignore: cast_nullable_to_non_nullable
                      as String,
            studentUserId: null == studentUserId
                ? _value.studentUserId
                : studentUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            studentName: null == studentName
                ? _value.studentName
                : studentName // ignore: cast_nullable_to_non_nullable
                      as String,
            openedById: freezed == openedById
                ? _value.openedById
                : openedById // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            openedAt: null == openedAt
                ? _value.openedAt
                : openedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentModuleId: freezed == currentModuleId
                ? _value.currentModuleId
                : currentModuleId // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentLessonId: freezed == currentLessonId
                ? _value.currentLessonId
                : currentLessonId // ignore: cast_nullable_to_non_nullable
                      as String?,
            completedLessons: null == completedLessons
                ? _value.completedLessons
                : completedLessons // ignore: cast_nullable_to_non_nullable
                      as int,
            totalLessons: null == totalLessons
                ? _value.totalLessons
                : totalLessons // ignore: cast_nullable_to_non_nullable
                      as int,
            progressPercentage: null == progressPercentage
                ? _value.progressPercentage
                : progressPercentage // ignore: cast_nullable_to_non_nullable
                      as double,
            moduleProgresses: null == moduleProgresses
                ? _value.moduleProgresses
                : moduleProgresses // ignore: cast_nullable_to_non_nullable
                      as List<OnlineCourseProgressResponse>,
            lessonProgresses: null == lessonProgresses
                ? _value.lessonProgresses
                : lessonProgresses // ignore: cast_nullable_to_non_nullable
                      as List<OnlineCourseProgressResponse>,
          )
          as $Val,
    );
  }

  /// Create a copy of OnlineCourseEnrollmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OnlineCourseSummaryResponseCopyWith<$Res> get course {
    return $OnlineCourseSummaryResponseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnlineCourseEnrollmentResponseImplCopyWith<$Res>
    implements $OnlineCourseEnrollmentResponseCopyWith<$Res> {
  factory _$$OnlineCourseEnrollmentResponseImplCopyWith(
    _$OnlineCourseEnrollmentResponseImpl value,
    $Res Function(_$OnlineCourseEnrollmentResponseImpl) then,
  ) = __$$OnlineCourseEnrollmentResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    OnlineCourseSummaryResponse course,
    String studentProfileId,
    String studentUserId,
    String studentName,
    String? openedById,
    String status,
    String openedAt,
    String? completedAt,
    String? currentModuleId,
    String? currentLessonId,
    int completedLessons,
    int totalLessons,
    double progressPercentage,
    List<OnlineCourseProgressResponse> moduleProgresses,
    List<OnlineCourseProgressResponse> lessonProgresses,
  });

  @override
  $OnlineCourseSummaryResponseCopyWith<$Res> get course;
}

/// @nodoc
class __$$OnlineCourseEnrollmentResponseImplCopyWithImpl<$Res>
    extends
        _$OnlineCourseEnrollmentResponseCopyWithImpl<
          $Res,
          _$OnlineCourseEnrollmentResponseImpl
        >
    implements _$$OnlineCourseEnrollmentResponseImplCopyWith<$Res> {
  __$$OnlineCourseEnrollmentResponseImplCopyWithImpl(
    _$OnlineCourseEnrollmentResponseImpl _value,
    $Res Function(_$OnlineCourseEnrollmentResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnlineCourseEnrollmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? course = null,
    Object? studentProfileId = null,
    Object? studentUserId = null,
    Object? studentName = null,
    Object? openedById = freezed,
    Object? status = null,
    Object? openedAt = null,
    Object? completedAt = freezed,
    Object? currentModuleId = freezed,
    Object? currentLessonId = freezed,
    Object? completedLessons = null,
    Object? totalLessons = null,
    Object? progressPercentage = null,
    Object? moduleProgresses = null,
    Object? lessonProgresses = null,
  }) {
    return _then(
      _$OnlineCourseEnrollmentResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        course: null == course
            ? _value.course
            : course // ignore: cast_nullable_to_non_nullable
                  as OnlineCourseSummaryResponse,
        studentProfileId: null == studentProfileId
            ? _value.studentProfileId
            : studentProfileId // ignore: cast_nullable_to_non_nullable
                  as String,
        studentUserId: null == studentUserId
            ? _value.studentUserId
            : studentUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        studentName: null == studentName
            ? _value.studentName
            : studentName // ignore: cast_nullable_to_non_nullable
                  as String,
        openedById: freezed == openedById
            ? _value.openedById
            : openedById // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        openedAt: null == openedAt
            ? _value.openedAt
            : openedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentModuleId: freezed == currentModuleId
            ? _value.currentModuleId
            : currentModuleId // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentLessonId: freezed == currentLessonId
            ? _value.currentLessonId
            : currentLessonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        completedLessons: null == completedLessons
            ? _value.completedLessons
            : completedLessons // ignore: cast_nullable_to_non_nullable
                  as int,
        totalLessons: null == totalLessons
            ? _value.totalLessons
            : totalLessons // ignore: cast_nullable_to_non_nullable
                  as int,
        progressPercentage: null == progressPercentage
            ? _value.progressPercentage
            : progressPercentage // ignore: cast_nullable_to_non_nullable
                  as double,
        moduleProgresses: null == moduleProgresses
            ? _value._moduleProgresses
            : moduleProgresses // ignore: cast_nullable_to_non_nullable
                  as List<OnlineCourseProgressResponse>,
        lessonProgresses: null == lessonProgresses
            ? _value._lessonProgresses
            : lessonProgresses // ignore: cast_nullable_to_non_nullable
                  as List<OnlineCourseProgressResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineCourseEnrollmentResponseImpl
    implements _OnlineCourseEnrollmentResponse {
  const _$OnlineCourseEnrollmentResponseImpl({
    required this.id,
    required this.course,
    required this.studentProfileId,
    required this.studentUserId,
    required this.studentName,
    this.openedById,
    required this.status,
    required this.openedAt,
    this.completedAt,
    this.currentModuleId,
    this.currentLessonId,
    this.completedLessons = 0,
    this.totalLessons = 0,
    this.progressPercentage = 0.0,
    final List<OnlineCourseProgressResponse> moduleProgresses = const [],
    final List<OnlineCourseProgressResponse> lessonProgresses = const [],
  }) : _moduleProgresses = moduleProgresses,
       _lessonProgresses = lessonProgresses;

  factory _$OnlineCourseEnrollmentResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$OnlineCourseEnrollmentResponseImplFromJson(json);

  @override
  final String id;
  @override
  final OnlineCourseSummaryResponse course;
  @override
  final String studentProfileId;
  @override
  final String studentUserId;
  @override
  final String studentName;
  @override
  final String? openedById;
  @override
  final String status;
  @override
  final String openedAt;
  @override
  final String? completedAt;
  @override
  final String? currentModuleId;
  @override
  final String? currentLessonId;
  @override
  @JsonKey()
  final int completedLessons;
  @override
  @JsonKey()
  final int totalLessons;
  @override
  @JsonKey()
  final double progressPercentage;
  final List<OnlineCourseProgressResponse> _moduleProgresses;
  @override
  @JsonKey()
  List<OnlineCourseProgressResponse> get moduleProgresses {
    if (_moduleProgresses is EqualUnmodifiableListView)
      return _moduleProgresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleProgresses);
  }

  final List<OnlineCourseProgressResponse> _lessonProgresses;
  @override
  @JsonKey()
  List<OnlineCourseProgressResponse> get lessonProgresses {
    if (_lessonProgresses is EqualUnmodifiableListView)
      return _lessonProgresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessonProgresses);
  }

  @override
  String toString() {
    return 'OnlineCourseEnrollmentResponse(id: $id, course: $course, studentProfileId: $studentProfileId, studentUserId: $studentUserId, studentName: $studentName, openedById: $openedById, status: $status, openedAt: $openedAt, completedAt: $completedAt, currentModuleId: $currentModuleId, currentLessonId: $currentLessonId, completedLessons: $completedLessons, totalLessons: $totalLessons, progressPercentage: $progressPercentage, moduleProgresses: $moduleProgresses, lessonProgresses: $lessonProgresses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineCourseEnrollmentResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.studentProfileId, studentProfileId) ||
                other.studentProfileId == studentProfileId) &&
            (identical(other.studentUserId, studentUserId) ||
                other.studentUserId == studentUserId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.openedById, openedById) ||
                other.openedById == openedById) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.openedAt, openedAt) ||
                other.openedAt == openedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.currentModuleId, currentModuleId) ||
                other.currentModuleId == currentModuleId) &&
            (identical(other.currentLessonId, currentLessonId) ||
                other.currentLessonId == currentLessonId) &&
            (identical(other.completedLessons, completedLessons) ||
                other.completedLessons == completedLessons) &&
            (identical(other.totalLessons, totalLessons) ||
                other.totalLessons == totalLessons) &&
            (identical(other.progressPercentage, progressPercentage) ||
                other.progressPercentage == progressPercentage) &&
            const DeepCollectionEquality().equals(
              other._moduleProgresses,
              _moduleProgresses,
            ) &&
            const DeepCollectionEquality().equals(
              other._lessonProgresses,
              _lessonProgresses,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    course,
    studentProfileId,
    studentUserId,
    studentName,
    openedById,
    status,
    openedAt,
    completedAt,
    currentModuleId,
    currentLessonId,
    completedLessons,
    totalLessons,
    progressPercentage,
    const DeepCollectionEquality().hash(_moduleProgresses),
    const DeepCollectionEquality().hash(_lessonProgresses),
  );

  /// Create a copy of OnlineCourseEnrollmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCourseEnrollmentResponseImplCopyWith<
    _$OnlineCourseEnrollmentResponseImpl
  >
  get copyWith =>
      __$$OnlineCourseEnrollmentResponseImplCopyWithImpl<
        _$OnlineCourseEnrollmentResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineCourseEnrollmentResponseImplToJson(this);
  }
}

abstract class _OnlineCourseEnrollmentResponse
    implements OnlineCourseEnrollmentResponse {
  const factory _OnlineCourseEnrollmentResponse({
    required final String id,
    required final OnlineCourseSummaryResponse course,
    required final String studentProfileId,
    required final String studentUserId,
    required final String studentName,
    final String? openedById,
    required final String status,
    required final String openedAt,
    final String? completedAt,
    final String? currentModuleId,
    final String? currentLessonId,
    final int completedLessons,
    final int totalLessons,
    final double progressPercentage,
    final List<OnlineCourseProgressResponse> moduleProgresses,
    final List<OnlineCourseProgressResponse> lessonProgresses,
  }) = _$OnlineCourseEnrollmentResponseImpl;

  factory _OnlineCourseEnrollmentResponse.fromJson(Map<String, dynamic> json) =
      _$OnlineCourseEnrollmentResponseImpl.fromJson;

  @override
  String get id;
  @override
  OnlineCourseSummaryResponse get course;
  @override
  String get studentProfileId;
  @override
  String get studentUserId;
  @override
  String get studentName;
  @override
  String? get openedById;
  @override
  String get status;
  @override
  String get openedAt;
  @override
  String? get completedAt;
  @override
  String? get currentModuleId;
  @override
  String? get currentLessonId;
  @override
  int get completedLessons;
  @override
  int get totalLessons;
  @override
  double get progressPercentage;
  @override
  List<OnlineCourseProgressResponse> get moduleProgresses;
  @override
  List<OnlineCourseProgressResponse> get lessonProgresses;

  /// Create a copy of OnlineCourseEnrollmentResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineCourseEnrollmentResponseImplCopyWith<
    _$OnlineCourseEnrollmentResponseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
