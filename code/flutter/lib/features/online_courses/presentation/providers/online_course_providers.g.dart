// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_course_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$onlineCourseDetailHash() =>
    r'ffa02e76c4faa4d564840a8591c8e90bf6490e1a';

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

/// See also [onlineCourseDetail].
@ProviderFor(onlineCourseDetail)
const onlineCourseDetailProvider = OnlineCourseDetailFamily();

/// See also [onlineCourseDetail].
class OnlineCourseDetailFamily
    extends Family<AsyncValue<OnlineCourseResponse>> {
  /// See also [onlineCourseDetail].
  const OnlineCourseDetailFamily();

  /// See also [onlineCourseDetail].
  OnlineCourseDetailProvider call(String courseId) {
    return OnlineCourseDetailProvider(courseId);
  }

  @override
  OnlineCourseDetailProvider getProviderOverride(
    covariant OnlineCourseDetailProvider provider,
  ) {
    return call(provider.courseId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'onlineCourseDetailProvider';
}

/// See also [onlineCourseDetail].
class OnlineCourseDetailProvider
    extends AutoDisposeFutureProvider<OnlineCourseResponse> {
  /// See also [onlineCourseDetail].
  OnlineCourseDetailProvider(String courseId)
    : this._internal(
        (ref) => onlineCourseDetail(ref as OnlineCourseDetailRef, courseId),
        from: onlineCourseDetailProvider,
        name: r'onlineCourseDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$onlineCourseDetailHash,
        dependencies: OnlineCourseDetailFamily._dependencies,
        allTransitiveDependencies:
            OnlineCourseDetailFamily._allTransitiveDependencies,
        courseId: courseId,
      );

  OnlineCourseDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final String courseId;

  @override
  Override overrideWith(
    FutureOr<OnlineCourseResponse> Function(OnlineCourseDetailRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OnlineCourseDetailProvider._internal(
        (ref) => create(ref as OnlineCourseDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OnlineCourseResponse> createElement() {
    return _OnlineCourseDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OnlineCourseDetailProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OnlineCourseDetailRef
    on AutoDisposeFutureProviderRef<OnlineCourseResponse> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _OnlineCourseDetailProviderElement
    extends AutoDisposeFutureProviderElement<OnlineCourseResponse>
    with OnlineCourseDetailRef {
  _OnlineCourseDetailProviderElement(super.provider);

  @override
  String get courseId => (origin as OnlineCourseDetailProvider).courseId;
}

String _$onlineCoursesNotifierHash() =>
    r'8f43fbc934878289a1f2a8c60e8426098770b66f';

/// See also [OnlineCoursesNotifier].
@ProviderFor(OnlineCoursesNotifier)
final onlineCoursesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      OnlineCoursesNotifier,
      List<OnlineCourseSummaryResponse>
    >.internal(
      OnlineCoursesNotifier.new,
      name: r'onlineCoursesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$onlineCoursesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OnlineCoursesNotifier =
    AutoDisposeAsyncNotifier<List<OnlineCourseSummaryResponse>>;
String _$myEnrollmentsNotifierHash() =>
    r'ecb17124503d0bfd2d0bb1690e61a54fdb7a953d';

/// See also [MyEnrollmentsNotifier].
@ProviderFor(MyEnrollmentsNotifier)
final myEnrollmentsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      MyEnrollmentsNotifier,
      List<OnlineCourseEnrollmentResponse>
    >.internal(
      MyEnrollmentsNotifier.new,
      name: r'myEnrollmentsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$myEnrollmentsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$MyEnrollmentsNotifier =
    AutoDisposeAsyncNotifier<List<OnlineCourseEnrollmentResponse>>;
String _$allEnrollmentsNotifierHash() =>
    r'e43e4bc4b4dad2f2517148b6196a1bec7cf5ea02';

/// See also [AllEnrollmentsNotifier].
@ProviderFor(AllEnrollmentsNotifier)
final allEnrollmentsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AllEnrollmentsNotifier,
      List<OnlineCourseEnrollmentResponse>
    >.internal(
      AllEnrollmentsNotifier.new,
      name: r'allEnrollmentsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$allEnrollmentsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AllEnrollmentsNotifier =
    AutoDisposeAsyncNotifier<List<OnlineCourseEnrollmentResponse>>;
String _$studentEnrollmentsNotifierHash() =>
    r'4182f00e51c6b3e848ece39d431a52b0f73f9151';

abstract class _$StudentEnrollmentsNotifier
    extends
        BuildlessAutoDisposeAsyncNotifier<
          List<OnlineCourseEnrollmentResponse>
        > {
  late final String studentProfileId;

  FutureOr<List<OnlineCourseEnrollmentResponse>> build(String studentProfileId);
}

/// See also [StudentEnrollmentsNotifier].
@ProviderFor(StudentEnrollmentsNotifier)
const studentEnrollmentsNotifierProvider = StudentEnrollmentsNotifierFamily();

/// See also [StudentEnrollmentsNotifier].
class StudentEnrollmentsNotifierFamily
    extends Family<AsyncValue<List<OnlineCourseEnrollmentResponse>>> {
  /// See also [StudentEnrollmentsNotifier].
  const StudentEnrollmentsNotifierFamily();

  /// See also [StudentEnrollmentsNotifier].
  StudentEnrollmentsNotifierProvider call(String studentProfileId) {
    return StudentEnrollmentsNotifierProvider(studentProfileId);
  }

  @override
  StudentEnrollmentsNotifierProvider getProviderOverride(
    covariant StudentEnrollmentsNotifierProvider provider,
  ) {
    return call(provider.studentProfileId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'studentEnrollmentsNotifierProvider';
}

/// See also [StudentEnrollmentsNotifier].
class StudentEnrollmentsNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          StudentEnrollmentsNotifier,
          List<OnlineCourseEnrollmentResponse>
        > {
  /// See also [StudentEnrollmentsNotifier].
  StudentEnrollmentsNotifierProvider(String studentProfileId)
    : this._internal(
        () => StudentEnrollmentsNotifier()..studentProfileId = studentProfileId,
        from: studentEnrollmentsNotifierProvider,
        name: r'studentEnrollmentsNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$studentEnrollmentsNotifierHash,
        dependencies: StudentEnrollmentsNotifierFamily._dependencies,
        allTransitiveDependencies:
            StudentEnrollmentsNotifierFamily._allTransitiveDependencies,
        studentProfileId: studentProfileId,
      );

  StudentEnrollmentsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.studentProfileId,
  }) : super.internal();

  final String studentProfileId;

  @override
  FutureOr<List<OnlineCourseEnrollmentResponse>> runNotifierBuild(
    covariant StudentEnrollmentsNotifier notifier,
  ) {
    return notifier.build(studentProfileId);
  }

  @override
  Override overrideWith(StudentEnrollmentsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: StudentEnrollmentsNotifierProvider._internal(
        () => create()..studentProfileId = studentProfileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        studentProfileId: studentProfileId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    StudentEnrollmentsNotifier,
    List<OnlineCourseEnrollmentResponse>
  >
  createElement() {
    return _StudentEnrollmentsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentEnrollmentsNotifierProvider &&
        other.studentProfileId == studentProfileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, studentProfileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin StudentEnrollmentsNotifierRef
    on
        AutoDisposeAsyncNotifierProviderRef<
          List<OnlineCourseEnrollmentResponse>
        > {
  /// The parameter `studentProfileId` of this provider.
  String get studentProfileId;
}

class _StudentEnrollmentsNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          StudentEnrollmentsNotifier,
          List<OnlineCourseEnrollmentResponse>
        >
    with StudentEnrollmentsNotifierRef {
  _StudentEnrollmentsNotifierProviderElement(super.provider);

  @override
  String get studentProfileId =>
      (origin as StudentEnrollmentsNotifierProvider).studentProfileId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
