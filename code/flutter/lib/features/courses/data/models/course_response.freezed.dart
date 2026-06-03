// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) {
  return _CourseResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseResponse {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  int get durationInMinutes => throw _privateConstructorUsedError;
  List<CourseSectionResponse> get sections =>
      throw _privateConstructorUsedError;

  /// Serializes this CourseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseResponseCopyWith<CourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseCopyWith<$Res> {
  factory $CourseResponseCopyWith(
    CourseResponse value,
    $Res Function(CourseResponse) then,
  ) = _$CourseResponseCopyWithImpl<$Res, CourseResponse>;
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    String level,
    int durationInMinutes,
    List<CourseSectionResponse> sections,
  });
}

/// @nodoc
class _$CourseResponseCopyWithImpl<$Res, $Val extends CourseResponse>
    implements $CourseResponseCopyWith<$Res> {
  _$CourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? level = null,
    Object? durationInMinutes = null,
    Object? sections = null,
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
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            durationInMinutes: null == durationInMinutes
                ? _value.durationInMinutes
                : durationInMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            sections: null == sections
                ? _value.sections
                : sections // ignore: cast_nullable_to_non_nullable
                      as List<CourseSectionResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseResponseImplCopyWith<$Res>
    implements $CourseResponseCopyWith<$Res> {
  factory _$$CourseResponseImplCopyWith(
    _$CourseResponseImpl value,
    $Res Function(_$CourseResponseImpl) then,
  ) = __$$CourseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? description,
    String level,
    int durationInMinutes,
    List<CourseSectionResponse> sections,
  });
}

/// @nodoc
class __$$CourseResponseImplCopyWithImpl<$Res>
    extends _$CourseResponseCopyWithImpl<$Res, _$CourseResponseImpl>
    implements _$$CourseResponseImplCopyWith<$Res> {
  __$$CourseResponseImplCopyWithImpl(
    _$CourseResponseImpl _value,
    $Res Function(_$CourseResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? level = null,
    Object? durationInMinutes = null,
    Object? sections = null,
  }) {
    return _then(
      _$CourseResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        durationInMinutes: null == durationInMinutes
            ? _value.durationInMinutes
            : durationInMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        sections: null == sections
            ? _value._sections
            : sections // ignore: cast_nullable_to_non_nullable
                  as List<CourseSectionResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseResponseImpl implements _CourseResponse {
  const _$CourseResponseImpl({
    required this.id,
    required this.title,
    this.description,
    required this.level,
    required this.durationInMinutes,
    final List<CourseSectionResponse> sections = const [],
  }) : _sections = sections;

  factory _$CourseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String level;
  @override
  final int durationInMinutes;
  final List<CourseSectionResponse> _sections;
  @override
  @JsonKey()
  List<CourseSectionResponse> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'CourseResponse(id: $id, title: $title, description: $description, level: $level, durationInMinutes: $durationInMinutes, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    level,
    durationInMinutes,
    const DeepCollectionEquality().hash(_sections),
  );

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      __$$CourseResponseImplCopyWithImpl<_$CourseResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseResponseImplToJson(this);
  }
}

abstract class _CourseResponse implements CourseResponse {
  const factory _CourseResponse({
    required final String id,
    required final String title,
    final String? description,
    required final String level,
    required final int durationInMinutes,
    final List<CourseSectionResponse> sections,
  }) = _$CourseResponseImpl;

  factory _CourseResponse.fromJson(Map<String, dynamic> json) =
      _$CourseResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get level;
  @override
  int get durationInMinutes;
  @override
  List<CourseSectionResponse> get sections;

  /// Create a copy of CourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
