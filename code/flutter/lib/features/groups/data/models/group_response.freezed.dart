// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) {
  return _GroupResponse.fromJson(json);
}

/// @nodoc
mixin _$GroupResponse {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get courseId => throw _privateConstructorUsedError;
  String get courseName => throw _privateConstructorUsedError;
  TeacherInfoResponse get teacher => throw _privateConstructorUsedError;
  int get capacity => throw _privateConstructorUsedError;
  String get scheduleType => throw _privateConstructorUsedError;
  List<String> get scheduleDays => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  int get currentStudents => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this GroupResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupResponseCopyWith<GroupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupResponseCopyWith<$Res> {
  factory $GroupResponseCopyWith(
    GroupResponse value,
    $Res Function(GroupResponse) then,
  ) = _$GroupResponseCopyWithImpl<$Res, GroupResponse>;
  @useResult
  $Res call({
    String id,
    String name,
    String courseId,
    String courseName,
    TeacherInfoResponse teacher,
    int capacity,
    String scheduleType,
    List<String> scheduleDays,
    bool active,
    int currentStudents,
    String status,
  });

  $TeacherInfoResponseCopyWith<$Res> get teacher;
}

/// @nodoc
class _$GroupResponseCopyWithImpl<$Res, $Val extends GroupResponse>
    implements $GroupResponseCopyWith<$Res> {
  _$GroupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? courseId = null,
    Object? courseName = null,
    Object? teacher = null,
    Object? capacity = null,
    Object? scheduleType = null,
    Object? scheduleDays = null,
    Object? active = null,
    Object? currentStudents = null,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            courseId: null == courseId
                ? _value.courseId
                : courseId // ignore: cast_nullable_to_non_nullable
                      as String,
            courseName: null == courseName
                ? _value.courseName
                : courseName // ignore: cast_nullable_to_non_nullable
                      as String,
            teacher: null == teacher
                ? _value.teacher
                : teacher // ignore: cast_nullable_to_non_nullable
                      as TeacherInfoResponse,
            capacity: null == capacity
                ? _value.capacity
                : capacity // ignore: cast_nullable_to_non_nullable
                      as int,
            scheduleType: null == scheduleType
                ? _value.scheduleType
                : scheduleType // ignore: cast_nullable_to_non_nullable
                      as String,
            scheduleDays: null == scheduleDays
                ? _value.scheduleDays
                : scheduleDays // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as bool,
            currentStudents: null == currentStudents
                ? _value.currentStudents
                : currentStudents // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of GroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TeacherInfoResponseCopyWith<$Res> get teacher {
    return $TeacherInfoResponseCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GroupResponseImplCopyWith<$Res>
    implements $GroupResponseCopyWith<$Res> {
  factory _$$GroupResponseImplCopyWith(
    _$GroupResponseImpl value,
    $Res Function(_$GroupResponseImpl) then,
  ) = __$$GroupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String courseId,
    String courseName,
    TeacherInfoResponse teacher,
    int capacity,
    String scheduleType,
    List<String> scheduleDays,
    bool active,
    int currentStudents,
    String status,
  });

  @override
  $TeacherInfoResponseCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$GroupResponseImplCopyWithImpl<$Res>
    extends _$GroupResponseCopyWithImpl<$Res, _$GroupResponseImpl>
    implements _$$GroupResponseImplCopyWith<$Res> {
  __$$GroupResponseImplCopyWithImpl(
    _$GroupResponseImpl _value,
    $Res Function(_$GroupResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? courseId = null,
    Object? courseName = null,
    Object? teacher = null,
    Object? capacity = null,
    Object? scheduleType = null,
    Object? scheduleDays = null,
    Object? active = null,
    Object? currentStudents = null,
    Object? status = null,
  }) {
    return _then(
      _$GroupResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        courseId: null == courseId
            ? _value.courseId
            : courseId // ignore: cast_nullable_to_non_nullable
                  as String,
        courseName: null == courseName
            ? _value.courseName
            : courseName // ignore: cast_nullable_to_non_nullable
                  as String,
        teacher: null == teacher
            ? _value.teacher
            : teacher // ignore: cast_nullable_to_non_nullable
                  as TeacherInfoResponse,
        capacity: null == capacity
            ? _value.capacity
            : capacity // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduleType: null == scheduleType
            ? _value.scheduleType
            : scheduleType // ignore: cast_nullable_to_non_nullable
                  as String,
        scheduleDays: null == scheduleDays
            ? _value._scheduleDays
            : scheduleDays // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as bool,
        currentStudents: null == currentStudents
            ? _value.currentStudents
            : currentStudents // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$GroupResponseImpl implements _GroupResponse {
  const _$GroupResponseImpl({
    required this.id,
    required this.name,
    required this.courseId,
    required this.courseName,
    required this.teacher,
    required this.capacity,
    required this.scheduleType,
    final List<String> scheduleDays = const [],
    required this.active,
    required this.currentStudents,
    required this.status,
  }) : _scheduleDays = scheduleDays;

  factory _$GroupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String courseId;
  @override
  final String courseName;
  @override
  final TeacherInfoResponse teacher;
  @override
  final int capacity;
  @override
  final String scheduleType;
  final List<String> _scheduleDays;
  @override
  @JsonKey()
  List<String> get scheduleDays {
    if (_scheduleDays is EqualUnmodifiableListView) return _scheduleDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleDays);
  }

  @override
  final bool active;
  @override
  final int currentStudents;
  @override
  final String status;

  @override
  String toString() {
    return 'GroupResponse(id: $id, name: $name, courseId: $courseId, courseName: $courseName, teacher: $teacher, capacity: $capacity, scheduleType: $scheduleType, scheduleDays: $scheduleDays, active: $active, currentStudents: $currentStudents, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.courseName, courseName) ||
                other.courseName == courseName) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.scheduleType, scheduleType) ||
                other.scheduleType == scheduleType) &&
            const DeepCollectionEquality().equals(
              other._scheduleDays,
              _scheduleDays,
            ) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.currentStudents, currentStudents) ||
                other.currentStudents == currentStudents) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    courseId,
    courseName,
    teacher,
    capacity,
    scheduleType,
    const DeepCollectionEquality().hash(_scheduleDays),
    active,
    currentStudents,
    status,
  );

  /// Create a copy of GroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupResponseImplCopyWith<_$GroupResponseImpl> get copyWith =>
      __$$GroupResponseImplCopyWithImpl<_$GroupResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupResponseImplToJson(this);
  }
}

abstract class _GroupResponse implements GroupResponse {
  const factory _GroupResponse({
    required final String id,
    required final String name,
    required final String courseId,
    required final String courseName,
    required final TeacherInfoResponse teacher,
    required final int capacity,
    required final String scheduleType,
    final List<String> scheduleDays,
    required final bool active,
    required final int currentStudents,
    required final String status,
  }) = _$GroupResponseImpl;

  factory _GroupResponse.fromJson(Map<String, dynamic> json) =
      _$GroupResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get courseId;
  @override
  String get courseName;
  @override
  TeacherInfoResponse get teacher;
  @override
  int get capacity;
  @override
  String get scheduleType;
  @override
  List<String> get scheduleDays;
  @override
  bool get active;
  @override
  int get currentStudents;
  @override
  String get status;

  /// Create a copy of GroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupResponseImplCopyWith<_$GroupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
