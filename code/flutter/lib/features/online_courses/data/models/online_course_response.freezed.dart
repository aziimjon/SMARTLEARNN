// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_course_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OnlineCourseResponse _$OnlineCourseResponseFromJson(Map<String, dynamic> json) {
  return _OnlineCourseResponse.fromJson(json);
}

/// @nodoc
mixin _$OnlineCourseResponse {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get unlockStrategy => throw _privateConstructorUsedError;
  int? get estimatedDurationInMinutes => throw _privateConstructorUsedError;
  String? get thumbnailId => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  String? get createdById => throw _privateConstructorUsedError;
  String? get createdByName => throw _privateConstructorUsedError;
  List<OnlineCourseModuleResponse> get modules =>
      throw _privateConstructorUsedError;

  /// Serializes this OnlineCourseResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineCourseResponseCopyWith<OnlineCourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineCourseResponseCopyWith<$Res> {
  factory $OnlineCourseResponseCopyWith(
    OnlineCourseResponse value,
    $Res Function(OnlineCourseResponse) then,
  ) = _$OnlineCourseResponseCopyWithImpl<$Res, OnlineCourseResponse>;
  @useResult
  $Res call({
    String id,
    String title,
    String slug,
    String? shortDescription,
    String? description,
    String level,
    String status,
    String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
    String? thumbnailUrl,
    String? createdById,
    String? createdByName,
    List<OnlineCourseModuleResponse> modules,
  });
}

/// @nodoc
class _$OnlineCourseResponseCopyWithImpl<
  $Res,
  $Val extends OnlineCourseResponse
>
    implements $OnlineCourseResponseCopyWith<$Res> {
  _$OnlineCourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? level = null,
    Object? status = null,
    Object? unlockStrategy = null,
    Object? estimatedDurationInMinutes = freezed,
    Object? thumbnailId = freezed,
    Object? thumbnailUrl = freezed,
    Object? createdById = freezed,
    Object? createdByName = freezed,
    Object? modules = null,
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
            slug: null == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String,
            shortDescription: freezed == shortDescription
                ? _value.shortDescription
                : shortDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            unlockStrategy: null == unlockStrategy
                ? _value.unlockStrategy
                : unlockStrategy // ignore: cast_nullable_to_non_nullable
                      as String,
            estimatedDurationInMinutes: freezed == estimatedDurationInMinutes
                ? _value.estimatedDurationInMinutes
                : estimatedDurationInMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            thumbnailId: freezed == thumbnailId
                ? _value.thumbnailId
                : thumbnailId // ignore: cast_nullable_to_non_nullable
                      as String?,
            thumbnailUrl: freezed == thumbnailUrl
                ? _value.thumbnailUrl
                : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdById: freezed == createdById
                ? _value.createdById
                : createdById // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdByName: freezed == createdByName
                ? _value.createdByName
                : createdByName // ignore: cast_nullable_to_non_nullable
                      as String?,
            modules: null == modules
                ? _value.modules
                : modules // ignore: cast_nullable_to_non_nullable
                      as List<OnlineCourseModuleResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnlineCourseResponseImplCopyWith<$Res>
    implements $OnlineCourseResponseCopyWith<$Res> {
  factory _$$OnlineCourseResponseImplCopyWith(
    _$OnlineCourseResponseImpl value,
    $Res Function(_$OnlineCourseResponseImpl) then,
  ) = __$$OnlineCourseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String slug,
    String? shortDescription,
    String? description,
    String level,
    String status,
    String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
    String? thumbnailUrl,
    String? createdById,
    String? createdByName,
    List<OnlineCourseModuleResponse> modules,
  });
}

/// @nodoc
class __$$OnlineCourseResponseImplCopyWithImpl<$Res>
    extends _$OnlineCourseResponseCopyWithImpl<$Res, _$OnlineCourseResponseImpl>
    implements _$$OnlineCourseResponseImplCopyWith<$Res> {
  __$$OnlineCourseResponseImplCopyWithImpl(
    _$OnlineCourseResponseImpl _value,
    $Res Function(_$OnlineCourseResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnlineCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? shortDescription = freezed,
    Object? description = freezed,
    Object? level = null,
    Object? status = null,
    Object? unlockStrategy = null,
    Object? estimatedDurationInMinutes = freezed,
    Object? thumbnailId = freezed,
    Object? thumbnailUrl = freezed,
    Object? createdById = freezed,
    Object? createdByName = freezed,
    Object? modules = null,
  }) {
    return _then(
      _$OnlineCourseResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        slug: null == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String,
        shortDescription: freezed == shortDescription
            ? _value.shortDescription
            : shortDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        unlockStrategy: null == unlockStrategy
            ? _value.unlockStrategy
            : unlockStrategy // ignore: cast_nullable_to_non_nullable
                  as String,
        estimatedDurationInMinutes: freezed == estimatedDurationInMinutes
            ? _value.estimatedDurationInMinutes
            : estimatedDurationInMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        thumbnailId: freezed == thumbnailId
            ? _value.thumbnailId
            : thumbnailId // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailUrl: freezed == thumbnailUrl
            ? _value.thumbnailUrl
            : thumbnailUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdById: freezed == createdById
            ? _value.createdById
            : createdById // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdByName: freezed == createdByName
            ? _value.createdByName
            : createdByName // ignore: cast_nullable_to_non_nullable
                  as String?,
        modules: null == modules
            ? _value._modules
            : modules // ignore: cast_nullable_to_non_nullable
                  as List<OnlineCourseModuleResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineCourseResponseImpl implements _OnlineCourseResponse {
  const _$OnlineCourseResponseImpl({
    required this.id,
    required this.title,
    required this.slug,
    this.shortDescription,
    this.description,
    required this.level,
    required this.status,
    required this.unlockStrategy,
    this.estimatedDurationInMinutes,
    this.thumbnailId,
    this.thumbnailUrl,
    this.createdById,
    this.createdByName,
    final List<OnlineCourseModuleResponse> modules = const [],
  }) : _modules = modules;

  factory _$OnlineCourseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnlineCourseResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String slug;
  @override
  final String? shortDescription;
  @override
  final String? description;
  @override
  final String level;
  @override
  final String status;
  @override
  final String unlockStrategy;
  @override
  final int? estimatedDurationInMinutes;
  @override
  final String? thumbnailId;
  @override
  final String? thumbnailUrl;
  @override
  final String? createdById;
  @override
  final String? createdByName;
  final List<OnlineCourseModuleResponse> _modules;
  @override
  @JsonKey()
  List<OnlineCourseModuleResponse> get modules {
    if (_modules is EqualUnmodifiableListView) return _modules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modules);
  }

  @override
  String toString() {
    return 'OnlineCourseResponse(id: $id, title: $title, slug: $slug, shortDescription: $shortDescription, description: $description, level: $level, status: $status, unlockStrategy: $unlockStrategy, estimatedDurationInMinutes: $estimatedDurationInMinutes, thumbnailId: $thumbnailId, thumbnailUrl: $thumbnailUrl, createdById: $createdById, createdByName: $createdByName, modules: $modules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineCourseResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.unlockStrategy, unlockStrategy) ||
                other.unlockStrategy == unlockStrategy) &&
            (identical(
                  other.estimatedDurationInMinutes,
                  estimatedDurationInMinutes,
                ) ||
                other.estimatedDurationInMinutes ==
                    estimatedDurationInMinutes) &&
            (identical(other.thumbnailId, thumbnailId) ||
                other.thumbnailId == thumbnailId) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName) &&
            const DeepCollectionEquality().equals(other._modules, _modules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    slug,
    shortDescription,
    description,
    level,
    status,
    unlockStrategy,
    estimatedDurationInMinutes,
    thumbnailId,
    thumbnailUrl,
    createdById,
    createdByName,
    const DeepCollectionEquality().hash(_modules),
  );

  /// Create a copy of OnlineCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCourseResponseImplCopyWith<_$OnlineCourseResponseImpl>
  get copyWith =>
      __$$OnlineCourseResponseImplCopyWithImpl<_$OnlineCourseResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineCourseResponseImplToJson(this);
  }
}

abstract class _OnlineCourseResponse implements OnlineCourseResponse {
  const factory _OnlineCourseResponse({
    required final String id,
    required final String title,
    required final String slug,
    final String? shortDescription,
    final String? description,
    required final String level,
    required final String status,
    required final String unlockStrategy,
    final int? estimatedDurationInMinutes,
    final String? thumbnailId,
    final String? thumbnailUrl,
    final String? createdById,
    final String? createdByName,
    final List<OnlineCourseModuleResponse> modules,
  }) = _$OnlineCourseResponseImpl;

  factory _OnlineCourseResponse.fromJson(Map<String, dynamic> json) =
      _$OnlineCourseResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get slug;
  @override
  String? get shortDescription;
  @override
  String? get description;
  @override
  String get level;
  @override
  String get status;
  @override
  String get unlockStrategy;
  @override
  int? get estimatedDurationInMinutes;
  @override
  String? get thumbnailId;
  @override
  String? get thumbnailUrl;
  @override
  String? get createdById;
  @override
  String? get createdByName;
  @override
  List<OnlineCourseModuleResponse> get modules;

  /// Create a copy of OnlineCourseResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineCourseResponseImplCopyWith<_$OnlineCourseResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
