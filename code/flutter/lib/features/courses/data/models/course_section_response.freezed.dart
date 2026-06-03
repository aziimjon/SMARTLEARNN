// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_section_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CourseSectionResponse _$CourseSectionResponseFromJson(
  Map<String, dynamic> json,
) {
  return _CourseSectionResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseSectionResponse {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  List<LessonResponse> get lessons => throw _privateConstructorUsedError;

  /// Serializes this CourseSectionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseSectionResponseCopyWith<CourseSectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSectionResponseCopyWith<$Res> {
  factory $CourseSectionResponseCopyWith(
    CourseSectionResponse value,
    $Res Function(CourseSectionResponse) then,
  ) = _$CourseSectionResponseCopyWithImpl<$Res, CourseSectionResponse>;
  @useResult
  $Res call({
    String id,
    String title,
    int orderIndex,
    String courseId,
    List<LessonResponse> lessons,
  });
}

/// @nodoc
class _$CourseSectionResponseCopyWithImpl<
  $Res,
  $Val extends CourseSectionResponse
>
    implements $CourseSectionResponseCopyWith<$Res> {
  _$CourseSectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? orderIndex = null,
    Object? courseId = null,
    Object? lessons = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            courseId: null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                      as String,
            lessons: null == lessons
                ? _value.lessons
                : lessons // ignore: cast_nullable_to_non_nullable
                      as List<LessonResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseSectionResponseImplCopyWith<$Res>
    implements $CourseSectionResponseCopyWith<$Res> {
  factory _$$CourseSectionResponseImplCopyWith(
    _$CourseSectionResponseImpl value,
    $Res Function(_$CourseSectionResponseImpl) then,
  ) = __$$CourseSectionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    int orderIndex,
    String courseId,
    List<LessonResponse> lessons,
  });
}

/// @nodoc
class __$$CourseSectionResponseImplCopyWithImpl<$Res>
    extends
        _$CourseSectionResponseCopyWithImpl<$Res, _$CourseSectionResponseImpl>
    implements _$$CourseSectionResponseImplCopyWith<$Res> {
  __$$CourseSectionResponseImplCopyWithImpl(
    _$CourseSectionResponseImpl _value,
    $Res Function(_$CourseSectionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? orderIndex = null,
    Object? courseId = null,
    Object? lessons = null,
  }) {
    return _then(
      _$CourseSectionResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        courseId: null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                  as String,
        lessons: null == lessons
            ? _value._lessons
            : lessons // ignore: cast_nullable_to_non_nullable
                  as List<LessonResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseSectionResponseImpl implements _CourseSectionResponse {
  const _$CourseSectionResponseImpl({
    required this.id,
    required this.title,
    required this.orderIndex,
    required this.courseId,
    final List<LessonResponse> lessons = const [],
  }) : _lessons = lessons;

  factory _$CourseSectionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseSectionResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final int orderIndex;
  @override
  final String courseId;
  final List<LessonResponse> _lessons;
  @override
  @JsonKey()
  List<LessonResponse> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'CourseSectionResponse(id: $id, title: $title, orderIndex: $orderIndex, courseId: $courseId, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseSectionResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    orderIndex,
    courseId,
    const DeepCollectionEquality().hash(_lessons),
  );

  /// Create a copy of CourseSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseSectionResponseImplCopyWith<_$CourseSectionResponseImpl>
  get copyWith =>
      __$$CourseSectionResponseImplCopyWithImpl<_$CourseSectionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseSectionResponseImplToJson(this);
  }
}

abstract class _CourseSectionResponse implements CourseSectionResponse {
  const factory _CourseSectionResponse({
    required final String id,
    required final String title,
    required final int orderIndex,
    required final String courseId,
    final List<LessonResponse> lessons,
  }) = _$CourseSectionResponseImpl;

  factory _CourseSectionResponse.fromJson(Map<String, dynamic> json) =
      _$CourseSectionResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get orderIndex;
  @override
  String get courseId;
  @override
  List<LessonResponse> get lessons;

  /// Create a copy of CourseSectionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseSectionResponseImplCopyWith<_$CourseSectionResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
