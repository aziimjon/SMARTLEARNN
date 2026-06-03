// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_course_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OnlineCourseSummaryResponse _$OnlineCourseSummaryResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OnlineCourseSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$OnlineCourseSummaryResponse {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get unlockStrategy => throw _privateConstructorUsedError;
  int? get estimatedDurationInMinutes => throw _privateConstructorUsedError;
  String? get thumbnailId => throw _privateConstructorUsedError;
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// Serializes this OnlineCourseSummaryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineCourseSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineCourseSummaryResponseCopyWith<OnlineCourseSummaryResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineCourseSummaryResponseCopyWith<$Res> {
  factory $OnlineCourseSummaryResponseCopyWith(
    OnlineCourseSummaryResponse value,
    $Res Function(OnlineCourseSummaryResponse) then,
  ) =
      _$OnlineCourseSummaryResponseCopyWithImpl<
        $Res,
        OnlineCourseSummaryResponse
      >;
  @useResult
  $Res call({
    String id,
    String title,
    String slug,
    String? shortDescription,
    String level,
    String status,
    String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
    String? thumbnailUrl,
  });
}

/// @nodoc
class _$OnlineCourseSummaryResponseCopyWithImpl<
  $Res,
  $Val extends OnlineCourseSummaryResponse
>
    implements $OnlineCourseSummaryResponseCopyWith<$Res> {
  _$OnlineCourseSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineCourseSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? shortDescription = freezed,
    Object? level = null,
    Object? status = null,
    Object? unlockStrategy = null,
    Object? estimatedDurationInMinutes = freezed,
    Object? thumbnailId = freezed,
    Object? thumbnailUrl = freezed,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnlineCourseSummaryResponseImplCopyWith<$Res>
    implements $OnlineCourseSummaryResponseCopyWith<$Res> {
  factory _$$OnlineCourseSummaryResponseImplCopyWith(
    _$OnlineCourseSummaryResponseImpl value,
    $Res Function(_$OnlineCourseSummaryResponseImpl) then,
  ) = __$$OnlineCourseSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String slug,
    String? shortDescription,
    String level,
    String status,
    String unlockStrategy,
    int? estimatedDurationInMinutes,
    String? thumbnailId,
    String? thumbnailUrl,
  });
}

/// @nodoc
class __$$OnlineCourseSummaryResponseImplCopyWithImpl<$Res>
    extends
        _$OnlineCourseSummaryResponseCopyWithImpl<
          $Res,
          _$OnlineCourseSummaryResponseImpl
        >
    implements _$$OnlineCourseSummaryResponseImplCopyWith<$Res> {
  __$$OnlineCourseSummaryResponseImplCopyWithImpl(
    _$OnlineCourseSummaryResponseImpl _value,
    $Res Function(_$OnlineCourseSummaryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnlineCourseSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? slug = null,
    Object? shortDescription = freezed,
    Object? level = null,
    Object? status = null,
    Object? unlockStrategy = null,
    Object? estimatedDurationInMinutes = freezed,
    Object? thumbnailId = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(
      _$OnlineCourseSummaryResponseImpl(
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineCourseSummaryResponseImpl
    implements _OnlineCourseSummaryResponse {
  const _$OnlineCourseSummaryResponseImpl({
    required this.id,
    required this.title,
    required this.slug,
    this.shortDescription,
    required this.level,
    required this.status,
    required this.unlockStrategy,
    this.estimatedDurationInMinutes,
    this.thumbnailId,
    this.thumbnailUrl,
  });

  factory _$OnlineCourseSummaryResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$OnlineCourseSummaryResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String slug;
  @override
  final String? shortDescription;
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
  String toString() {
    return 'OnlineCourseSummaryResponse(id: $id, title: $title, slug: $slug, shortDescription: $shortDescription, level: $level, status: $status, unlockStrategy: $unlockStrategy, estimatedDurationInMinutes: $estimatedDurationInMinutes, thumbnailId: $thumbnailId, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineCourseSummaryResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
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
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    slug,
    shortDescription,
    level,
    status,
    unlockStrategy,
    estimatedDurationInMinutes,
    thumbnailId,
    thumbnailUrl,
  );

  /// Create a copy of OnlineCourseSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCourseSummaryResponseImplCopyWith<_$OnlineCourseSummaryResponseImpl>
  get copyWith =>
      __$$OnlineCourseSummaryResponseImplCopyWithImpl<
        _$OnlineCourseSummaryResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineCourseSummaryResponseImplToJson(this);
  }
}

abstract class _OnlineCourseSummaryResponse
    implements OnlineCourseSummaryResponse {
  const factory _OnlineCourseSummaryResponse({
    required final String id,
    required final String title,
    required final String slug,
    final String? shortDescription,
    required final String level,
    required final String status,
    required final String unlockStrategy,
    final int? estimatedDurationInMinutes,
    final String? thumbnailId,
    final String? thumbnailUrl,
  }) = _$OnlineCourseSummaryResponseImpl;

  factory _OnlineCourseSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$OnlineCourseSummaryResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get slug;
  @override
  String? get shortDescription;
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

  /// Create a copy of OnlineCourseSummaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineCourseSummaryResponseImplCopyWith<_$OnlineCourseSummaryResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
