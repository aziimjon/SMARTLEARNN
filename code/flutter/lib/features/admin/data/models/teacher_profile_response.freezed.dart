// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TeacherProfileResponse _$TeacherProfileResponseFromJson(
  Map<String, dynamic> json,
) {
  return _TeacherProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$TeacherProfileResponse {
  String get teacherId => throw _privateConstructorUsedError;
  AuthMe get user => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  /// Serializes this TeacherProfileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TeacherProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TeacherProfileResponseCopyWith<TeacherProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherProfileResponseCopyWith<$Res> {
  factory $TeacherProfileResponseCopyWith(
    TeacherProfileResponse value,
    $Res Function(TeacherProfileResponse) then,
  ) = _$TeacherProfileResponseCopyWithImpl<$Res, TeacherProfileResponse>;
  @useResult
  $Res call({String teacherId, AuthMe user, String? position});

  $AuthMeCopyWith<$Res> get user;
}

/// @nodoc
class _$TeacherProfileResponseCopyWithImpl<
  $Res,
  $Val extends TeacherProfileResponse
>
    implements $TeacherProfileResponseCopyWith<$Res> {
  _$TeacherProfileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TeacherProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? user = null,
    Object? position = freezed,
  }) {
    return _then(
      _value.copyWith(
            teacherId: null == teacherId
                ? _value.teacherId
                : teacherId // ignore: cast_nullable_to_non_nullable
                      as String,
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as AuthMe,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of TeacherProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthMeCopyWith<$Res> get user {
    return $AuthMeCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TeacherProfileResponseImplCopyWith<$Res>
    implements $TeacherProfileResponseCopyWith<$Res> {
  factory _$$TeacherProfileResponseImplCopyWith(
    _$TeacherProfileResponseImpl value,
    $Res Function(_$TeacherProfileResponseImpl) then,
  ) = __$$TeacherProfileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String teacherId, AuthMe user, String? position});

  @override
  $AuthMeCopyWith<$Res> get user;
}

/// @nodoc
class __$$TeacherProfileResponseImplCopyWithImpl<$Res>
    extends
        _$TeacherProfileResponseCopyWithImpl<$Res, _$TeacherProfileResponseImpl>
    implements _$$TeacherProfileResponseImplCopyWith<$Res> {
  __$$TeacherProfileResponseImplCopyWithImpl(
    _$TeacherProfileResponseImpl _value,
    $Res Function(_$TeacherProfileResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TeacherProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? teacherId = null,
    Object? user = null,
    Object? position = freezed,
  }) {
    return _then(
      _$TeacherProfileResponseImpl(
        teacherId: null == teacherId
            ? _value.teacherId
            : teacherId // ignore: cast_nullable_to_non_nullable
                  as String,
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthMe,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TeacherProfileResponseImpl extends _TeacherProfileResponse {
  const _$TeacherProfileResponseImpl({
    required this.teacherId,
    required this.user,
    this.position,
  }) : super._();

  factory _$TeacherProfileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeacherProfileResponseImplFromJson(json);

  @override
  final String teacherId;
  @override
  final AuthMe user;
  @override
  final String? position;

  @override
  String toString() {
    return 'TeacherProfileResponse(teacherId: $teacherId, user: $user, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeacherProfileResponseImpl &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, teacherId, user, position);

  /// Create a copy of TeacherProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TeacherProfileResponseImplCopyWith<_$TeacherProfileResponseImpl>
  get copyWith =>
      __$$TeacherProfileResponseImplCopyWithImpl<_$TeacherProfileResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TeacherProfileResponseImplToJson(this);
  }
}

abstract class _TeacherProfileResponse extends TeacherProfileResponse {
  const factory _TeacherProfileResponse({
    required final String teacherId,
    required final AuthMe user,
    final String? position,
  }) = _$TeacherProfileResponseImpl;
  const _TeacherProfileResponse._() : super._();

  factory _TeacherProfileResponse.fromJson(Map<String, dynamic> json) =
      _$TeacherProfileResponseImpl.fromJson;

  @override
  String get teacherId;
  @override
  AuthMe get user;
  @override
  String? get position;

  /// Create a copy of TeacherProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TeacherProfileResponseImplCopyWith<_$TeacherProfileResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
