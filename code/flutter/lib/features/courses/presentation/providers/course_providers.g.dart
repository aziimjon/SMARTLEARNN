// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailHash() => r'9e7a9bb92860197272e02ad81dcce30d6aa5d001';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [courseDetail].
@ProviderFor(courseDetail)
const courseDetailProvider = CourseDetailFamily();

/// See also [courseDetail].
class CourseDetailFamily extends Family<AsyncValue<CourseResponse>> {
  /// See also [courseDetail].
  const CourseDetailFamily();

  /// See also [courseDetail].
  CourseDetailProvider call(String id) {
    return CourseDetailProvider(id);
  }

  @override
  CourseDetailProvider getProviderOverride(
    covariant CourseDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'courseDetailProvider';
}

/// See also [courseDetail].
class CourseDetailProvider extends AutoDisposeFutureProvider<CourseResponse> {
  /// See also [courseDetail].
  CourseDetailProvider(String id)
    : this._internal(
        (ref) => courseDetail(ref as CourseDetailRef, id),
        from: courseDetailProvider,
        name: r'courseDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$courseDetailHash,
        dependencies: CourseDetailFamily._dependencies,
        allTransitiveDependencies:
            CourseDetailFamily._allTransitiveDependencies,
        id: id,
      );

  CourseDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<CourseResponse> Function(CourseDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseDetailProvider._internal(
        (ref) => create(ref as CourseDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CourseResponse> createElement() {
    return _CourseDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CourseDetailRef on AutoDisposeFutureProviderRef<CourseResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CourseDetailProviderElement
    extends AutoDisposeFutureProviderElement<CourseResponse>
    with CourseDetailRef {
  _CourseDetailProviderElement(super.provider);

  @override
  String get id => (origin as CourseDetailProvider).id;
}

String _$lessonDetailHash() => r'b5d38ecefcee0193f83dd2a6dd6c67e4a970e053';

/// See also [lessonDetail].
@ProviderFor(lessonDetail)
const lessonDetailProvider = LessonDetailFamily();

/// See also [lessonDetail].
class LessonDetailFamily extends Family<AsyncValue<LessonResponse>> {
  /// See also [lessonDetail].
  const LessonDetailFamily();

  /// See also [lessonDetail].
  LessonDetailProvider call(String id) {
    return LessonDetailProvider(id);
  }

  @override
  LessonDetailProvider getProviderOverride(
    covariant LessonDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lessonDetailProvider';
}

/// See also [lessonDetail].
class LessonDetailProvider extends AutoDisposeFutureProvider<LessonResponse> {
  /// See also [lessonDetail].
  LessonDetailProvider(String id)
    : this._internal(
        (ref) => lessonDetail(ref as LessonDetailRef, id),
        from: lessonDetailProvider,
        name: r'lessonDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lessonDetailHash,
        dependencies: LessonDetailFamily._dependencies,
        allTransitiveDependencies:
            LessonDetailFamily._allTransitiveDependencies,
        id: id,
      );

  LessonDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<LessonResponse> Function(LessonDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonDetailProvider._internal(
        (ref) => create(ref as LessonDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LessonResponse> createElement() {
    return _LessonDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LessonDetailRef on AutoDisposeFutureProviderRef<LessonResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _LessonDetailProviderElement
    extends AutoDisposeFutureProviderElement<LessonResponse>
    with LessonDetailRef {
  _LessonDetailProviderElement(super.provider);

  @override
  String get id => (origin as LessonDetailProvider).id;
}

String _$coursesNotifierHash() => r'3b13de1cfc8a2066a936932546e45e6aa4a11920';

/// See also [CoursesNotifier].
@ProviderFor(CoursesNotifier)
final coursesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      CoursesNotifier,
      List<CourseResponse>
    >.internal(
      CoursesNotifier.new,
      name: r'coursesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$coursesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CoursesNotifier = AutoDisposeAsyncNotifier<List<CourseResponse>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
