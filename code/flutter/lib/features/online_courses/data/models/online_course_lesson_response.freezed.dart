// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_course_lesson_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OnlineCourseLessonResponse _$OnlineCourseLessonResponseFromJson(
  Map<String, dynamic> json,
) {
  return _OnlineCourseLessonResponse.fromJson(json);
}

/// @nodoc
mixin _$OnlineCourseLessonResponse {
  String get id => throw _privateConstructorUsedError;
  String get moduleId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int get orderIndex => throw _privateConstructorUsedError;
  int? get durationInMinutes => throw _privateConstructorUsedError;
  bool get freePreview => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get availableFrom => throw _privateConstructorUsedError;
  String? get videoAttachmentId => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  List<OnlineCourseLessonMaterialResponse> get materials =>
      throw _privateConstructorUsedError;

  /// Serializes this OnlineCourseLessonResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlineCourseLessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlineCourseLessonResponseCopyWith<OnlineCourseLessonResponse>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlineCourseLessonResponseCopyWith<$Res> {
  factory $OnlineCourseLessonResponseCopyWith(
    OnlineCourseLessonResponse value,
    $Res Function(OnlineCourseLessonResponse) then,
  ) =
      _$OnlineCourseLessonResponseCopyWithImpl<
        $Res,
        OnlineCourseLessonResponse
      >;
  @useResult
  $Res call({
    String id,
    String moduleId,
    String title,
    String? description,
    String? content,
    int orderIndex,
    int? durationInMinutes,
    bool freePreview,
    String status,
    String? availableFrom,
    String? videoAttachmentId,
    String? videoUrl,
    List<OnlineCourseLessonMaterialResponse> materials,
  });
}

/// @nodoc
class _$OnlineCourseLessonResponseCopyWithImpl<
  $Res,
  $Val extends OnlineCourseLessonResponse
>
    implements $OnlineCourseLessonResponseCopyWith<$Res> {
  _$OnlineCourseLessonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlineCourseLessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? moduleId = null,
    Object? title = null,
    Object? description = freezed,
    Object? content = freezed,
    Object? orderIndex = null,
    Object? durationInMinutes = freezed,
    Object? freePreview = null,
    Object? status = null,
    Object? availableFrom = freezed,
    Object? videoAttachmentId = freezed,
    Object? videoUrl = freezed,
    Object? materials = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            moduleId: null == moduleId
                ? _value.moduleId
                : moduleId // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            orderIndex: null == orderIndex
                ? _value.orderIndex
                : orderIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            durationInMinutes: freezed == durationInMinutes
                ? _value.durationInMinutes
                : durationInMinutes // ignore: cast_nullable_to_non_nullable
                      as int?,
            freePreview: null == freePreview
                ? _value.freePreview
                : freePreview // ignore: cast_nullable_to_non_nullable
                      as bool,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            availableFrom: freezed == availableFrom
                ? _value.availableFrom
                : availableFrom // ignore: cast_nullable_to_non_nullable
                      as String?,
            videoAttachmentId: freezed == videoAttachmentId
                ? _value.videoAttachmentId
                : videoAttachmentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            materials: null == materials
                ? _value.materials
                : materials // ignore: cast_nullable_to_non_nullable
                      as List<OnlineCourseLessonMaterialResponse>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OnlineCourseLessonResponseImplCopyWith<$Res>
    implements $OnlineCourseLessonResponseCopyWith<$Res> {
  factory _$$OnlineCourseLessonResponseImplCopyWith(
    _$OnlineCourseLessonResponseImpl value,
    $Res Function(_$OnlineCourseLessonResponseImpl) then,
  ) = __$$OnlineCourseLessonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String moduleId,
    String title,
    String? description,
    String? content,
    int orderIndex,
    int? durationInMinutes,
    bool freePreview,
    String status,
    String? availableFrom,
    String? videoAttachmentId,
    String? videoUrl,
    List<OnlineCourseLessonMaterialResponse> materials,
  });
}

/// @nodoc
class __$$OnlineCourseLessonResponseImplCopyWithImpl<$Res>
    extends
        _$OnlineCourseLessonResponseCopyWithImpl<
          $Res,
          _$OnlineCourseLessonResponseImpl
        >
    implements _$$OnlineCourseLessonResponseImplCopyWith<$Res> {
  __$$OnlineCourseLessonResponseImplCopyWithImpl(
    _$OnlineCourseLessonResponseImpl _value,
    $Res Function(_$OnlineCourseLessonResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OnlineCourseLessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? moduleId = null,
    Object? title = null,
    Object? description = freezed,
    Object? content = freezed,
    Object? orderIndex = null,
    Object? durationInMinutes = freezed,
    Object? freePreview = null,
    Object? status = null,
    Object? availableFrom = freezed,
    Object? videoAttachmentId = freezed,
    Object? videoUrl = freezed,
    Object? materials = null,
  }) {
    return _then(
      _$OnlineCourseLessonResponseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        moduleId: null == moduleId
            ? _value.moduleId
            : moduleId // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        orderIndex: null == orderIndex
            ? _value.orderIndex
            : orderIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        durationInMinutes: freezed == durationInMinutes
            ? _value.durationInMinutes
            : durationInMinutes // ignore: cast_nullable_to_non_nullable
                  as int?,
        freePreview: null == freePreview
            ? _value.freePreview
            : freePreview // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        availableFrom: freezed == availableFrom
            ? _value.availableFrom
            : availableFrom // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoAttachmentId: freezed == videoAttachmentId
            ? _value.videoAttachmentId
            : videoAttachmentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        materials: null == materials
            ? _value._materials
            : materials // ignore: cast_nullable_to_non_nullable
                  as List<OnlineCourseLessonMaterialResponse>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlineCourseLessonResponseImpl implements _OnlineCourseLessonResponse {
  const _$OnlineCourseLessonResponseImpl({
    required this.id,
    required this.moduleId,
    required this.title,
    this.description,
    this.content,
    required this.orderIndex,
    this.durationInMinutes,
    this.freePreview = false,
    required this.status,
    this.availableFrom,
    this.videoAttachmentId,
    this.videoUrl,
    final List<OnlineCourseLessonMaterialResponse> materials = const [],
  }) : _materials = materials;

  factory _$OnlineCourseLessonResponseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$OnlineCourseLessonResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String moduleId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? content;
  @override
  final int orderIndex;
  @override
  final int? durationInMinutes;
  @override
  @JsonKey()
  final bool freePreview;
  @override
  final String status;
  @override
  final String? availableFrom;
  @override
  final String? videoAttachmentId;
  @override
  final String? videoUrl;
  final List<OnlineCourseLessonMaterialResponse> _materials;
  @override
  @JsonKey()
  List<OnlineCourseLessonMaterialResponse> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'OnlineCourseLessonResponse(id: $id, moduleId: $moduleId, title: $title, description: $description, content: $content, orderIndex: $orderIndex, durationInMinutes: $durationInMinutes, freePreview: $freePreview, status: $status, availableFrom: $availableFrom, videoAttachmentId: $videoAttachmentId, videoUrl: $videoUrl, materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlineCourseLessonResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.moduleId, moduleId) ||
                other.moduleId == moduleId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.orderIndex, orderIndex) ||
                other.orderIndex == orderIndex) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.freePreview, freePreview) ||
                other.freePreview == freePreview) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.availableFrom, availableFrom) ||
                other.availableFrom == availableFrom) &&
            (identical(other.videoAttachmentId, videoAttachmentId) ||
                other.videoAttachmentId == videoAttachmentId) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            const DeepCollectionEquality().equals(
              other._materials,
              _materials,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    moduleId,
    title,
    description,
    content,
    orderIndex,
    durationInMinutes,
    freePreview,
    status,
    availableFrom,
    videoAttachmentId,
    videoUrl,
    const DeepCollectionEquality().hash(_materials),
  );

  /// Create a copy of OnlineCourseLessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlineCourseLessonResponseImplCopyWith<_$OnlineCourseLessonResponseImpl>
  get copyWith =>
      __$$OnlineCourseLessonResponseImplCopyWithImpl<
        _$OnlineCourseLessonResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlineCourseLessonResponseImplToJson(this);
  }
}

abstract class _OnlineCourseLessonResponse
    implements OnlineCourseLessonResponse {
  const factory _OnlineCourseLessonResponse({
    required final String id,
    required final String moduleId,
    required final String title,
    final String? description,
    final String? content,
    required final int orderIndex,
    final int? durationInMinutes,
    final bool freePreview,
    required final String status,
    final String? availableFrom,
    final String? videoAttachmentId,
    final String? videoUrl,
    final List<OnlineCourseLessonMaterialResponse> materials,
  }) = _$OnlineCourseLessonResponseImpl;

  factory _OnlineCourseLessonResponse.fromJson(Map<String, dynamic> json) =
      _$OnlineCourseLessonResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get moduleId;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get content;
  @override
  int get orderIndex;
  @override
  int? get durationInMinutes;
  @override
  bool get freePreview;
  @override
  String get status;
  @override
  String? get availableFrom;
  @override
  String? get videoAttachmentId;
  @override
  String? get videoUrl;
  @override
  List<OnlineCourseLessonMaterialResponse> get materials;

  /// Create a copy of OnlineCourseLessonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlineCourseLessonResponseImplCopyWith<_$OnlineCourseLessonResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
