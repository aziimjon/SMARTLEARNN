// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_me.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthMe _$AuthMeFromJson(Map<String, dynamic> json) {
  return _AuthMe.fromJson(json);
}

/// @nodoc
mixin _$AuthMe {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get birthDate => throw _privateConstructorUsedError;
  String? get profileImageAttachmentId => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String? get profileBackgroundAttachmentId =>
      throw _privateConstructorUsedError;
  String? get profileBackgroundUrl => throw _privateConstructorUsedError;
  List<Role> get roles => throw _privateConstructorUsedError;

  /// Serializes this AuthMe to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthMeCopyWith<AuthMe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthMeCopyWith<$Res> {
  factory $AuthMeCopyWith(AuthMe value, $Res Function(AuthMe) then) =
      _$AuthMeCopyWithImpl<$Res, AuthMe>;
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    String? middleName,
    String? email,
    String? phoneNumber,
    String? gender,
    String status,
    String? birthDate,
    String? profileImageAttachmentId,
    String? profileImageUrl,
    String? profileBackgroundAttachmentId,
    String? profileBackgroundUrl,
    List<Role> roles,
  });
}

/// @nodoc
class _$AuthMeCopyWithImpl<$Res, $Val extends AuthMe>
    implements $AuthMeCopyWith<$Res> {
  _$AuthMeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? middleName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? status = null,
    Object? birthDate = freezed,
    Object? profileImageAttachmentId = freezed,
    Object? profileImageUrl = freezed,
    Object? profileBackgroundAttachmentId = freezed,
    Object? profileBackgroundUrl = freezed,
    Object? roles = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            middleName: freezed == middleName
                ? _value.middleName
                : middleName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            birthDate: freezed == birthDate
                ? _value.birthDate
                : birthDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileImageAttachmentId: freezed == profileImageAttachmentId
                ? _value.profileImageAttachmentId
                : profileImageAttachmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileImageUrl: freezed == profileImageUrl
                ? _value.profileImageUrl
                : profileImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileBackgroundAttachmentId:
                freezed == profileBackgroundAttachmentId
                ? _value.profileBackgroundAttachmentId
                : profileBackgroundAttachmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            profileBackgroundUrl: freezed == profileBackgroundUrl
                ? _value.profileBackgroundUrl
                : profileBackgroundUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            roles: null == roles
                ? _value.roles
                : roles // ignore: cast_nullable_to_non_nullable
                      as List<Role>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthMeImplCopyWith<$Res> implements $AuthMeCopyWith<$Res> {
  factory _$$AuthMeImplCopyWith(
    _$AuthMeImpl value,
    $Res Function(_$AuthMeImpl) then,
  ) = __$$AuthMeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String firstName,
    String lastName,
    String? middleName,
    String? email,
    String? phoneNumber,
    String? gender,
    String status,
    String? birthDate,
    String? profileImageAttachmentId,
    String? profileImageUrl,
    String? profileBackgroundAttachmentId,
    String? profileBackgroundUrl,
    List<Role> roles,
  });
}

/// @nodoc
class __$$AuthMeImplCopyWithImpl<$Res>
    extends _$AuthMeCopyWithImpl<$Res, _$AuthMeImpl>
    implements _$$AuthMeImplCopyWith<$Res> {
  __$$AuthMeImplCopyWithImpl(
    _$AuthMeImpl _value,
    $Res Function(_$AuthMeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthMe
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? middleName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? gender = freezed,
    Object? status = null,
    Object? birthDate = freezed,
    Object? profileImageAttachmentId = freezed,
    Object? profileImageUrl = freezed,
    Object? profileBackgroundAttachmentId = freezed,
    Object? profileBackgroundUrl = freezed,
    Object? roles = null,
  }) {
    return _then(
      _$AuthMeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        middleName: freezed == middleName
            ? _value.middleName
            : middleName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        birthDate: freezed == birthDate
            ? _value.birthDate
            : birthDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileImageAttachmentId: freezed == profileImageAttachmentId
            ? _value.profileImageAttachmentId
            : profileImageAttachmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileImageUrl: freezed == profileImageUrl
            ? _value.profileImageUrl
            : profileImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileBackgroundAttachmentId: freezed == profileBackgroundAttachmentId
            ? _value.profileBackgroundAttachmentId
            : profileBackgroundAttachmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        profileBackgroundUrl: freezed == profileBackgroundUrl
            ? _value.profileBackgroundUrl
            : profileBackgroundUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        roles: null == roles
            ? _value._roles
            : roles // ignore: cast_nullable_to_non_nullable
                  as List<Role>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthMeImpl extends _AuthMe {
  const _$AuthMeImpl({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.middleName,
    this.email,
    this.phoneNumber,
    this.gender,
    required this.status,
    this.birthDate,
    this.profileImageAttachmentId,
    this.profileImageUrl,
    this.profileBackgroundAttachmentId,
    this.profileBackgroundUrl,
    final List<Role> roles = const [],
  }) : _roles = roles,
       super._();

  factory _$AuthMeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthMeImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? middleName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? gender;
  @override
  final String status;
  @override
  final String? birthDate;
  @override
  final String? profileImageAttachmentId;
  @override
  final String? profileImageUrl;
  @override
  final String? profileBackgroundAttachmentId;
  @override
  final String? profileBackgroundUrl;
  final List<Role> _roles;
  @override
  @JsonKey()
  List<Role> get roles {
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_roles);
  }

  @override
  String toString() {
    return 'AuthMe(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName, email: $email, phoneNumber: $phoneNumber, gender: $gender, status: $status, birthDate: $birthDate, profileImageAttachmentId: $profileImageAttachmentId, profileImageUrl: $profileImageUrl, profileBackgroundAttachmentId: $profileBackgroundAttachmentId, profileBackgroundUrl: $profileBackgroundUrl, roles: $roles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthMeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(
                  other.profileImageAttachmentId,
                  profileImageAttachmentId,
                ) ||
                other.profileImageAttachmentId == profileImageAttachmentId) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(
                  other.profileBackgroundAttachmentId,
                  profileBackgroundAttachmentId,
                ) ||
                other.profileBackgroundAttachmentId ==
                    profileBackgroundAttachmentId) &&
            (identical(other.profileBackgroundUrl, profileBackgroundUrl) ||
                other.profileBackgroundUrl == profileBackgroundUrl) &&
            const DeepCollectionEquality().equals(other._roles, _roles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    firstName,
    lastName,
    middleName,
    email,
    phoneNumber,
    gender,
    status,
    birthDate,
    profileImageAttachmentId,
    profileImageUrl,
    profileBackgroundAttachmentId,
    profileBackgroundUrl,
    const DeepCollectionEquality().hash(_roles),
  );

  /// Create a copy of AuthMe
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthMeImplCopyWith<_$AuthMeImpl> get copyWith =>
      __$$AuthMeImplCopyWithImpl<_$AuthMeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthMeImplToJson(this);
  }
}

abstract class _AuthMe extends AuthMe {
  const factory _AuthMe({
    required final String id,
    required final String firstName,
    required final String lastName,
    final String? middleName,
    final String? email,
    final String? phoneNumber,
    final String? gender,
    required final String status,
    final String? birthDate,
    final String? profileImageAttachmentId,
    final String? profileImageUrl,
    final String? profileBackgroundAttachmentId,
    final String? profileBackgroundUrl,
    final List<Role> roles,
  }) = _$AuthMeImpl;
  const _AuthMe._() : super._();

  factory _AuthMe.fromJson(Map<String, dynamic> json) = _$AuthMeImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get middleName;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get gender;
  @override
  String get status;
  @override
  String? get birthDate;
  @override
  String? get profileImageAttachmentId;
  @override
  String? get profileImageUrl;
  @override
  String? get profileBackgroundAttachmentId;
  @override
  String? get profileBackgroundUrl;
  @override
  List<Role> get roles;

  /// Create a copy of AuthMe
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthMeImplCopyWith<_$AuthMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
