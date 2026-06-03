// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_course_module_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OnlineCourseModuleResponse _$OnlineCourseModuleResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OnlineCourseModuleResponse.fromJson(json);
}

/// @nodoc
mixin _$OnlineCourseModuleResponse {
  String get id => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get availableFrom => throw _privateConstructorUsedError;
  List<OnlineCourseLessonResponse> get lessons =>
      throw _privateConstructorUsedError;

  /// Serializes this OnlineCourseModuleResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineCourseModuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineCourseModuleResponseCopyWith<OnlineCourseModuleResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineCourseModuleResponseCopyWith<$Res> {
  factory $OnlineCourseModuleResponseCopyWith(
    OnlineCourseModuleResponse value,
    $Res Function(OnlineCourseModuleResponse) then,
  ) =
      _$OnlineCourseModuleResponseCopyWithImpl<
        $Res,
        OnlineCourseModuleResponse
      >;
  @useResult
  $Res call({
    String id,
    String courseId,
    String title,
    String? description,
    int orderIndex,
    String status,
    String? availableFrom,
    List<OnlineCourseLessonResponse> lessons,
  });
}

/// @nodoc
class _$OnlineCourseModuleResponseCopyWithImpl<
  $Res,
  $Val extends OnlineCourseModuleResponse
>
    implements $OnlineCourseModuleResponseCopyWith<$Res> {
  _$OnlineCourseModuleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineCourseModuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? title = null,
    Object? description = freezed,
    Object? orderIndex = null,
    Object? status = null,
    Object? availableFrom = freezed,
    Object? lessons = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            courseId: null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            availableFrom: freezed == availableFrom
                ? _value.availableFrom
                : availableFrom // ignore: cast_nullable_to_non_nullable
                      as String?,
            lessons: null == lessons
                ? _value.lessons
                : lessons // ignore: cast_nullable_to_non_nullable
                      as List<OnlineCourseLessonResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnlineCourseModuleResponseImplCopyWith<$Res>
    implements $OnlineCourseModuleResponseCopyWith<$Res> {
  factory _$$OnlineCourseModuleResponseImplCopyWith(
    _$OnlineCourseModuleResponseImpl value,
    $Res Function(_$OnlineCourseModuleResponseImpl) then,
  ) = __$$OnlineCourseModuleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String courseId,
    String title,
    String? description,
    int orderIndex,
    String status,
    String? availableFrom,
    List<OnlineCourseLessonResponse> lessons,
  });
}

/// @nodoc
class __$$OnlineCourseModuleResponseImplCopyWithImpl<$Res>
    extends
        _$OnlineCourseModuleResponseCopyWithImpl<
          $Res,
          _$OnlineCourseModuleResponseImpl
        >
    implements _$$OnlineCourseModuleResponseImplCopyWith<$Res> {
  __$$OnlineCourseModuleResponseImplCopyWithImpl(
    _$OnlineCourseModuleResponseImpl _value,
    $Res Function(_$OnlineCourseModuleResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnlineCourseModuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseId = null,
    Object? title = null,
    Object? description = freezed,
    Object? orderIndex = null,
    Object? status = null,
    Object? availableFrom = freezed,
    Object? lessons = null,
  }) {
    return _then(
      _$OnlineCourseModuleResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        courseId: null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        availableFrom: freezed == availableFrom
            ? _value.availableFrom
            : availableFrom // ignore: cast_nullable_to_non_nullable
                  as String?,
        lessons: null == lessons
            ? _value._lessons
            : lessons // ignore: cast_nullable_to_non_nullable
                  as List<OnlineCourseLessonResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineCourseModuleResponseImpl implements _OnlineCourseModuleResponse {
  const _$OnlineCourseModuleResponseImpl({
    required this.id,
    required this.courseId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.status,
    this.availableFrom,
    final List<OnlineCourseLessonResponse> lessons = const [],
  }) : _lessons = lessons;

  factory _$OnlineCourseModuleResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$OnlineCourseModuleResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String courseId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int orderIndex;
  @override
  final String status;
  @override
  final String? availableFrom;
  final List<OnlineCourseLessonResponse> _lessons;
  @override
  @JsonKey()
  List<OnlineCourseLessonResponse> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'OnlineCourseModuleResponse(id: $id, courseId: $courseId, title: $title, description: $description, orderIndex: $orderIndex, status: $status, availableFrom: $availableFrom, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineCourseModuleResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    courseId,
    title,
    description,
    orderIndex,
    status,
    availableFrom,
    const DeepCollectionEquality().hash(_lessons),
  );

  /// Create a copy of OnlineCourseModuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCourseModuleResponseImplCopyWith<_$OnlineCourseModuleResponseImpl>
  get copyWith =>
      __$$OnlineCourseModuleResponseImplCopyWithImpl<
        _$OnlineCourseModuleResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineCourseModuleResponseImplToJson(this);
  }
}

abstract class _OnlineCourseModuleResponse
    implements OnlineCourseModuleResponse {
  const factory _OnlineCourseModuleResponse({
    required final String id,
    required final String courseId,
    required final String title,
    final String? description,
    required final int orderIndex,
    required final String status,
    final String? availableFrom,
    final List<OnlineCourseLessonResponse> lessons,
  }) = _$OnlineCourseModuleResponseImpl;

  factory _OnlineCourseModuleResponse.fromJson(Map<String, dynamic> json) =
      _$OnlineCourseModuleResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get courseId;
  @override
  String get title;
  @override
  String? get description;
  @override
  int get orderIndex;
  @override
  String get status;
  @override
  String? get availableFrom;
  @override
  List<OnlineCourseLessonResponse> get lessons;

  /// Create a copy of OnlineCourseModuleResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineCourseModuleResponseImplCopyWith<_$OnlineCourseModuleResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
