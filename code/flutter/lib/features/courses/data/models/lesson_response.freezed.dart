// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LessonResponse _$LessonResponseFromJson(Map<String, dynamic> json) {
  return _LessonResponse.fromJson(json);
}

/// @nodoc
mixin _$LessonResponse {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int get durationInMinutes => throw _privateConstructorUsedError;
  String get sectionId => throw _privateConstructorUsedError;

  /// Serializes this LessonResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LessonResponseCopyWith<LessonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonResponseCopyWith<$Res> {
  factory $LessonResponseCopyWith(
    LessonResponse value,
    $Res Function(LessonResponse) then,
  ) = _$LessonResponseCopyWithImpl<$Res, LessonResponse>;
  @useResult
  $Res call({
    String id,
    String title,
    String? content,
    int durationInMinutes,
    String sectionId,
  });
}

/// @nodoc
class _$LessonResponseCopyWithImpl<$Res, $Val extends LessonResponse>
    implements $LessonResponseCopyWith<$Res> {
  _$LessonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = freezed,
    Object? durationInMinutes = null,
    Object? sectionId = null,
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
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            durationInMinutes: null == durationInMinutes
                ? _value.durationInMinutes
                : durationInMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            sectionId: null == sectionId
                ? _value.sectionId
                : sectionId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LessonResponseImplCopyWith<$Res>
    implements $LessonResponseCopyWith<$Res> {
  factory _$$LessonResponseImplCopyWith(
    _$LessonResponseImpl value,
    $Res Function(_$LessonResponseImpl) then,
  ) = __$$LessonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String? content,
    int durationInMinutes,
    String sectionId,
  });
}

/// @nodoc
class __$$LessonResponseImplCopyWithImpl<$Res>
    extends _$LessonResponseCopyWithImpl<$Res, _$LessonResponseImpl>
    implements _$$LessonResponseImplCopyWith<$Res> {
  __$$LessonResponseImplCopyWithImpl(
    _$LessonResponseImpl _value,
    $Res Function(_$LessonResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = freezed,
    Object? durationInMinutes = null,
    Object? sectionId = null,
  }) {
    return _then(
      _$LessonResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        durationInMinutes: null == durationInMinutes
            ? _value.durationInMinutes
            : durationInMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        sectionId: null == sectionId
            ? _value.sectionId
            : sectionId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonResponseImpl implements _LessonResponse {
  const _$LessonResponseImpl({
    required this.id,
    required this.title,
    this.content,
    required this.durationInMinutes,
    required this.sectionId,
  });

  factory _$LessonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? content;
  @override
  final int durationInMinutes;
  @override
  final String sectionId;

  @override
  String toString() {
    return 'LessonResponse(id: $id, title: $title, content: $content, durationInMinutes: $durationInMinutes, sectionId: $sectionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.sectionId, sectionId) ||
                other.sectionId == sectionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    durationInMinutes,
    sectionId,
  );

  /// Create a copy of LessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonResponseImplCopyWith<_$LessonResponseImpl> get copyWith =>
      __$$LessonResponseImplCopyWithImpl<_$LessonResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonResponseImplToJson(this);
  }
}

abstract class _LessonResponse implements LessonResponse {
  const factory _LessonResponse({
    required final String id,
    required final String title,
    final String? content,
    required final int durationInMinutes,
    required final String sectionId,
  }) = _$LessonResponseImpl;

  factory _LessonResponse.fromJson(Map<String, dynamic> json) =
      _$LessonResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String? get content;
  @override
  int get durationInMinutes;
  @override
  String get sectionId;

  /// Create a copy of LessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LessonResponseImplCopyWith<_$LessonResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
