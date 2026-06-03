// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudentProfileResponse _$StudentProfileResponseFromJson(
  Map<String, dynamic> json,
) {
  return _StudentProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$StudentProfileResponse {
  AuthMe get baseData => throw _privateConstructorUsedError;
  String? get studentId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  /// Serializes this StudentProfileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudentProfileResponseCopyWith<StudentProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentProfileResponseCopyWith<$Res> {
  factory $StudentProfileResponseCopyWith(
    StudentProfileResponse value,
    $Res Function(StudentProfileResponse) then,
  ) = _$StudentProfileResponseCopyWithImpl<$Res, StudentProfileResponse>;
  @useResult
  $Res call({AuthMe baseData, String? studentId, String? status});

  $AuthMeCopyWith<$Res> get baseData;
}

/// @nodoc
class _$StudentProfileResponseCopyWithImpl<
  $Res,
  $Val extends StudentProfileResponse
>
    implements $StudentProfileResponseCopyWith<$Res> {
  _$StudentProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseData = null,
    Object? studentId = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _value.copyWith(
            baseData: null == baseData
                ? _value.baseData
                : baseData // ignore: cast_nullable_to_non_nullable
                      as AuthMe,
            studentId: freezed == studentId
                ? _value.studentId
                : studentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of StudentProfileResponse
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
abstract class _$$StudentProfileResponseImplCopyWith<$Res>
    implements $StudentProfileResponseCopyWith<$Res> {
  factory _$$StudentProfileResponseImplCopyWith(
    _$StudentProfileResponseImpl value,
    $Res Function(_$StudentProfileResponseImpl) then,
  ) = __$$StudentProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthMe baseData, String? studentId, String? status});

  @override
  $AuthMeCopyWith<$Res> get baseData;
}

/// @nodoc
class __$$StudentProfileResponseImplCopyWithImpl<$Res>
    extends
        _$StudentProfileResponseCopyWithImpl<$Res, _$StudentProfileResponseImpl>
    implements _$$StudentProfileResponseImplCopyWith<$Res> {
  __$$StudentProfileResponseImplCopyWithImpl(
    _$StudentProfileResponseImpl _value,
    $Res Function(_$StudentProfileResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseData = null,
    Object? studentId = freezed,
    Object? status = freezed,
  }) {
    return _then(
      _$StudentProfileResponseImpl(
        baseData: null == baseData
            ? _value.baseData
            : baseData // ignore: cast_nullable_to_non_nullable
                  as AuthMe,
        studentId: freezed == studentId
            ? _value.studentId
            : studentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudentProfileResponseImpl extends _StudentProfileResponse {
  const _$StudentProfileResponseImpl({
    required this.baseData,
    this.studentId,
    this.status,
  }) : super._();

  factory _$StudentProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudentProfileResponseImplFromJson(json);

  @override
  final AuthMe baseData;
  @override
  final String? studentId;
  @override
  final String? status;

  @override
  String toString() {
    return 'StudentProfileResponse(baseData: $baseData, studentId: $studentId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentProfileResponseImpl &&
            (identical(other.baseData, baseData) ||
                other.baseData == baseData) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseData, studentId, status);

  /// Create a copy of StudentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentProfileResponseImplCopyWith<_$StudentProfileResponseImpl>
  get copyWith =>
      __$$StudentProfileResponseImplCopyWithImpl<_$StudentProfileResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StudentProfileResponseImplToJson(this);
  }
}

abstract class _StudentProfileResponse extends StudentProfileResponse {
  const factory _StudentProfileResponse({
    required final AuthMe baseData,
    final String? studentId,
    final String? status,
  }) = _$StudentProfileResponseImpl;
  const _StudentProfileResponse._() : super._();

  factory _StudentProfileResponse.fromJson(Map<String, dynamic> json) =
      _$StudentProfileResponseImpl.fromJson;

  @override
  AuthMe get baseData;
  @override
  String? get studentId;
  @override
  String? get status;

  /// Create a copy of StudentProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudentProfileResponseImplCopyWith<_$StudentProfileResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
