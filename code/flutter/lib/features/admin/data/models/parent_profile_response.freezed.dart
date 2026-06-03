// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ParentProfileResponse _$ParentProfileResponseFromJson(
  Map<String, dynamic> json,
) {
  return _ParentProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$ParentProfileResponse {
  AuthMe get baseData => throw _privateConstructorUsedError;
  int get studentsCount => throw _privateConstructorUsedError;

  /// Serializes this ParentProfileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ParentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParentProfileResponseCopyWith<ParentProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentProfileResponseCopyWith<$Res> {
  factory $ParentProfileResponseCopyWith(
    ParentProfileResponse value,
    $Res Function(ParentProfileResponse) then,
  ) = _$ParentProfileResponseCopyWithImpl<$Res, ParentProfileResponse>;
  @useResult
  $Res call({AuthMe baseData, int studentsCount});

  $AuthMeCopyWith<$Res> get baseData;
}

/// @nodoc
class _$ParentProfileResponseCopyWithImpl<
  $Res,
  $Val extends ParentProfileResponse
>
    implements $ParentProfileResponseCopyWith<$Res> {
  _$ParentProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? baseData = null, Object? studentsCount = null}) {
    return _then(
      _value.copyWith(
            baseData: null == baseData
                ? _value.baseData
                : baseData // ignore: cast_nullable_to_non_nullable
                      as AuthMe,
            studentsCount: null == studentsCount
                ? _value.studentsCount
                : studentsCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }

  /// Create a copy of ParentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthMeCopyWith<$Res> get baseData {
    return $AuthMeCopyWith<$Res>(_value.baseData, (value) {
      return _then(_value.copyWith(baseData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParentProfileResponseImplCopyWith<$Res>
    implements $ParentProfileResponseCopyWith<$Res> {
  factory _$$ParentProfileResponseImplCopyWith(
    _$ParentProfileResponseImpl value,
    $Res Function(_$ParentProfileResponseImpl) then,
  ) = __$$ParentProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthMe baseData, int studentsCount});

  @override
  $AuthMeCopyWith<$Res> get baseData;
}

/// @nodoc
class __$$ParentProfileResponseImplCopyWithImpl<$Res>
    extends
        _$ParentProfileResponseCopyWithImpl<$Res, _$ParentProfileResponseImpl>
    implements _$$ParentProfileResponseImplCopyWith<$Res> {
  __$$ParentProfileResponseImplCopyWithImpl(
    _$ParentProfileResponseImpl _value,
    $Res Function(_$ParentProfileResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ParentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? baseData = null, Object? studentsCount = null}) {
    return _then(
      _$ParentProfileResponseImpl(
        baseData: null == baseData
            ? _value.baseData
            : baseData // ignore: cast_nullable_to_non_nullable
                  as AuthMe,
        studentsCount: null == studentsCount
            ? _value.studentsCount
            : studentsCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ParentProfileResponseImpl extends _ParentProfileResponse {
  const _$ParentProfileResponseImpl({
    required this.baseData,
    this.studentsCount = 0,
  }) : super._();

  factory _$ParentProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParentProfileResponseImplFromJson(json);

  @override
  final AuthMe baseData;
  @override
  @JsonKey()
  final int studentsCount;

  @override
  String toString() {
    return 'ParentProfileResponse(baseData: $baseData, studentsCount: $studentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParentProfileResponseImpl &&
            (identical(other.baseData, baseData) ||
                other.baseData == baseData) &&
            (identical(other.studentsCount, studentsCount) ||
                other.studentsCount == studentsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseData, studentsCount);

  /// Create a copy of ParentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParentProfileResponseImplCopyWith<_$ParentProfileResponseImpl>
  get copyWith =>
      __$$ParentProfileResponseImplCopyWithImpl<_$ParentProfileResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ParentProfileResponseImplToJson(this);
  }
}

abstract class _ParentProfileResponse extends ParentProfileResponse {
  const factory _ParentProfileResponse({
    required final AuthMe baseData,
    final int studentsCount,
  }) = _$ParentProfileResponseImpl;
  const _ParentProfileResponse._() : super._();

  factory _ParentProfileResponse.fromJson(Map<String, dynamic> json) =
      _$ParentProfileResponseImpl.fromJson;

  @override
  AuthMe get baseData;
  @override
  int get studentsCount;

  /// Create a copy of ParentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParentProfileResponseImplCopyWith<_$ParentProfileResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
