// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) {
  return _AttendanceResponse.fromJson(json);
}

/// @nodoc
mixin _$AttendanceResponse {
  String get id => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String? get studentProfileId => throw _privateConstructorUsedError;
  String? get studentFullName => throw _privateConstructorUsedError;
  String get lessonSessionId => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get groupName => throw _privateConstructorUsedError;
  String get lessonId => throw _privateConstructorUsedError;
  String get lessonTitle => throw _privateConstructorUsedError;
  String get lessonStartTime => throw _privateConstructorUsedError;
  String get lessonEndTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this AttendanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceResponseCopyWith<AttendanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceResponseCopyWith<$Res> {
  factory $AttendanceResponseCopyWith(
    AttendanceResponse value,
    $Res Function(AttendanceResponse) then,
  ) = _$AttendanceResponseCopyWithImpl<$Res, AttendanceResponse>;
  @useResult
  $Res call({
    String id,
    String studentId,
    String? studentProfileId,
    String? studentFullName,
    String lessonSessionId,
    String groupId,
    String groupName,
    String lessonId,
    String lessonTitle,
    String lessonStartTime,
    String lessonEndTime,
    String status,
  });
}

/// @nodoc
class _$AttendanceResponseCopyWithImpl<$Res, $Val extends AttendanceResponse>
    implements $AttendanceResponseCopyWith<$Res> {
  _$AttendanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? studentProfileId = freezed,
    Object? studentFullName = freezed,
    Object? lessonSessionId = null,
    Object? groupId = null,
    Object? groupName = null,
    Object? lessonId = null,
    Object? lessonTitle = null,
    Object? lessonStartTime = null,
    Object? lessonEndTime = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            studentId: null == studentId
                ? _value.studentId
                : studentId // ignore: cast_nullable_to_non_nullable
                      as String,
            studentProfileId: freezed == studentProfileId
                ? _value.studentProfileId
                : studentProfileId // ignore: cast_nullable_to_non_nullable
                      as String?,
            studentFullName: freezed == studentFullName
                ? _value.studentFullName
                : studentFullName // ignore: cast_nullable_to_non_nullable
                      as String?,
            lessonSessionId: null == lessonSessionId
                ? _value.lessonSessionId
                : lessonSessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            groupId: null == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                      as String,
            groupName: null == groupName
                ? _value.groupName
                : groupName // ignore: cast_nullable_to_non_nullable
                      as String,
            lessonId: null == lessonId
                ? _value.lessonId
                : lessonId // ignore: cast_nullable_to_non_nullable
                      as String,
            lessonTitle: null == lessonTitle
                ? _value.lessonTitle
                : lessonTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            lessonStartTime: null == lessonStartTime
                ? _value.lessonStartTime
                : lessonStartTime // ignore: cast_nullable_to_non_nullable
                      as String,
            lessonEndTime: null == lessonEndTime
                ? _value.lessonEndTime
                : lessonEndTime // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttendanceResponseImplCopyWith<$Res>
    implements $AttendanceResponseCopyWith<$Res> {
  factory _$$AttendanceResponseImplCopyWith(
    _$AttendanceResponseImpl value,
    $Res Function(_$AttendanceResponseImpl) then,
  ) = __$$AttendanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String studentId,
    String? studentProfileId,
    String? studentFullName,
    String lessonSessionId,
    String groupId,
    String groupName,
    String lessonId,
    String lessonTitle,
    String lessonStartTime,
    String lessonEndTime,
    String status,
  });
}

/// @nodoc
class __$$AttendanceResponseImplCopyWithImpl<$Res>
    extends _$AttendanceResponseCopyWithImpl<$Res, _$AttendanceResponseImpl>
    implements _$$AttendanceResponseImplCopyWith<$Res> {
  __$$AttendanceResponseImplCopyWithImpl(
    _$AttendanceResponseImpl _value,
    $Res Function(_$AttendanceResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AttendanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? studentProfileId = freezed,
    Object? studentFullName = freezed,
    Object? lessonSessionId = null,
    Object? groupId = null,
    Object? groupName = null,
    Object? lessonId = null,
    Object? lessonTitle = null,
    Object? lessonStartTime = null,
    Object? lessonEndTime = null,
    Object? status = null,
  }) {
    return _then(
      _$AttendanceResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        studentId: null == studentId
            ? _value.studentId
            : studentId // ignore: cast_nullable_to_non_nullable
                  as String,
        studentProfileId: freezed == studentProfileId
            ? _value.studentProfileId
            : studentProfileId // ignore: cast_nullable_to_non_nullable
                  as String?,
        studentFullName: freezed == studentFullName
            ? _value.studentFullName
            : studentFullName // ignore: cast_nullable_to_non_nullable
                  as String?,
        lessonSessionId: null == lessonSessionId
            ? _value.lessonSessionId
            : lessonSessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        groupId: null == groupId
            ? _value.groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as String,
        groupName: null == groupName
            ? _value.groupName
            : groupName // ignore: cast_nullable_to_non_nullable
                  as String,
        lessonId: null == lessonId
            ? _value.lessonId
            : lessonId // ignore: cast_nullable_to_non_nullable
                  as String,
        lessonTitle: null == lessonTitle
            ? _value.lessonTitle
            : lessonTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        lessonStartTime: null == lessonStartTime
            ? _value.lessonStartTime
            : lessonStartTime // ignore: cast_nullable_to_non_nullable
                  as String,
        lessonEndTime: null == lessonEndTime
            ? _value.lessonEndTime
            : lessonEndTime // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceResponseImpl implements _AttendanceResponse {
  const _$AttendanceResponseImpl({
    required this.id,
    required this.studentId,
    this.studentProfileId,
    this.studentFullName,
    required this.lessonSessionId,
    required this.groupId,
    required this.groupName,
    required this.lessonId,
    required this.lessonTitle,
    required this.lessonStartTime,
    required this.lessonEndTime,
    required this.status,
  });

  factory _$AttendanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String studentId;
  @override
  final String? studentProfileId;
  @override
  final String? studentFullName;
  @override
  final String lessonSessionId;
  @override
  final String groupId;
  @override
  final String groupName;
  @override
  final String lessonId;
  @override
  final String lessonTitle;
  @override
  final String lessonStartTime;
  @override
  final String lessonEndTime;
  @override
  final String status;

  @override
  String toString() {
    return 'AttendanceResponse(id: $id, studentId: $studentId, studentProfileId: $studentProfileId, studentFullName: $studentFullName, lessonSessionId: $lessonSessionId, groupId: $groupId, groupName: $groupName, lessonId: $lessonId, lessonTitle: $lessonTitle, lessonStartTime: $lessonStartTime, lessonEndTime: $lessonEndTime, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentProfileId, studentProfileId) ||
                other.studentProfileId == studentProfileId) &&
            (identical(other.studentFullName, studentFullName) ||
                other.studentFullName == studentFullName) &&
            (identical(other.lessonSessionId, lessonSessionId) ||
                other.lessonSessionId == lessonSessionId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.lessonId, lessonId) ||
                other.lessonId == lessonId) &&
            (identical(other.lessonTitle, lessonTitle) ||
                other.lessonTitle == lessonTitle) &&
            (identical(other.lessonStartTime, lessonStartTime) ||
                other.lessonStartTime == lessonStartTime) &&
            (identical(other.lessonEndTime, lessonEndTime) ||
                other.lessonEndTime == lessonEndTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    studentId,
    studentProfileId,
    studentFullName,
    lessonSessionId,
    groupId,
    groupName,
    lessonId,
    lessonTitle,
    lessonStartTime,
    lessonEndTime,
    status,
  );

  /// Create a copy of AttendanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceResponseImplCopyWith<_$AttendanceResponseImpl> get copyWith =>
      __$$AttendanceResponseImplCopyWithImpl<_$AttendanceResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceResponseImplToJson(this);
  }
}

abstract class _AttendanceResponse implements AttendanceResponse {
  const factory _AttendanceResponse({
    required final String id,
    required final String studentId,
    final String? studentProfileId,
    final String? studentFullName,
    required final String lessonSessionId,
    required final String groupId,
    required final String groupName,
    required final String lessonId,
    required final String lessonTitle,
    required final String lessonStartTime,
    required final String lessonEndTime,
    required final String status,
  }) = _$AttendanceResponseImpl;

  factory _AttendanceResponse.fromJson(Map<String, dynamic> json) =
      _$AttendanceResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get studentId;
  @override
  String? get studentProfileId;
  @override
  String? get studentFullName;
  @override
  String get lessonSessionId;
  @override
  String get groupId;
  @override
  String get groupName;
  @override
  String get lessonId;
  @override
  String get lessonTitle;
  @override
  String get lessonStartTime;
  @override
  String get lessonEndTime;
  @override
  String get status;

  /// Create a copy of AttendanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceResponseImplCopyWith<_$AttendanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
