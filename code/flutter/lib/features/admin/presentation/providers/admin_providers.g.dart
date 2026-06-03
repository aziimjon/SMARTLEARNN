// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$adminCourseSectionsHash() =>
    r'dcbadfc931dbbb82316e16e7bea07ba79b092c19';

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

/// See also [adminCourseSections].
@ProviderFor(adminCourseSections)
const adminCourseSectionsProvider = AdminCourseSectionsFamily();

/// See also [adminCourseSections].
class AdminCourseSectionsFamily
    extends Family<AsyncValue<List<CourseSectionResponse>>> {
  /// See also [adminCourseSections].
  const AdminCourseSectionsFamily();

  /// See also [adminCourseSections].
  AdminCourseSectionsProvider call(String courseId) {
    return AdminCourseSectionsProvider(courseId);
  }

  @override
  AdminCourseSectionsProvider getProviderOverride(
    covariant AdminCourseSectionsProvider provider,
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
  String? get name => r'adminCourseSectionsProvider';
}

/// See also [adminCourseSections].
class AdminCourseSectionsProvider
    extends AutoDisposeFutureProvider<List<CourseSectionResponse>> {
  /// See also [adminCourseSections].
  AdminCourseSectionsProvider(String courseId)
    : this._internal(
        (ref) => adminCourseSections(ref as AdminCourseSectionsRef, courseId),
        from: adminCourseSectionsProvider,
        name: r'adminCourseSectionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminCourseSectionsHash,
        dependencies: AdminCourseSectionsFamily._dependencies,
        allTransitiveDependencies:
            AdminCourseSectionsFamily._allTransitiveDependencies,
        courseId: courseId,
      );

  AdminCourseSectionsProvider._internal(
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
    FutureOr<List<CourseSectionResponse>> Function(
      AdminCourseSectionsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdminCourseSectionsProvider._internal(
        (ref) => create(ref as AdminCourseSectionsRef),
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
  AutoDisposeFutureProviderElement<List<CourseSectionResponse>>
  createElement() {
    return _AdminCourseSectionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminCourseSectionsProvider && other.courseId == courseId;
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
mixin AdminCourseSectionsRef
    on AutoDisposeFutureProviderRef<List<CourseSectionResponse>> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _AdminCourseSectionsProviderElement
    extends AutoDisposeFutureProviderElement<List<CourseSectionResponse>>
    with AdminCourseSectionsRef {
  _AdminCourseSectionsProviderElement(super.provider);

  @override
  String get courseId => (origin as AdminCourseSectionsProvider).courseId;
}

String _$adminSectionLessonsHash() =>
    r'16ffe458eeea92ac4d9aa7ef5fab86bb885fcb4d';

/// See also [adminSectionLessons].
@ProviderFor(adminSectionLessons)
const adminSectionLessonsProvider = AdminSectionLessonsFamily();

/// See also [adminSectionLessons].
class AdminSectionLessonsFamily
    extends Family<AsyncValue<List<LessonResponse>>> {
  /// See also [adminSectionLessons].
  const AdminSectionLessonsFamily();

  /// See also [adminSectionLessons].
  AdminSectionLessonsProvider call(String sectionId) {
    return AdminSectionLessonsProvider(sectionId);
  }

  @override
  AdminSectionLessonsProvider getProviderOverride(
    covariant AdminSectionLessonsProvider provider,
  ) {
    return call(provider.sectionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adminSectionLessonsProvider';
}

/// See also [adminSectionLessons].
class AdminSectionLessonsProvider
    extends AutoDisposeFutureProvider<List<LessonResponse>> {
  /// See also [adminSectionLessons].
  AdminSectionLessonsProvider(String sectionId)
    : this._internal(
        (ref) => adminSectionLessons(ref as AdminSectionLessonsRef, sectionId),
        from: adminSectionLessonsProvider,
        name: r'adminSectionLessonsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminSectionLessonsHash,
        dependencies: AdminSectionLessonsFamily._dependencies,
        allTransitiveDependencies:
            AdminSectionLessonsFamily._allTransitiveDependencies,
        sectionId: sectionId,
      );

  AdminSectionLessonsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sectionId,
  }) : super.internal();

  final String sectionId;

  @override
  Override overrideWith(
    FutureOr<List<LessonResponse>> Function(AdminSectionLessonsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdminSectionLessonsProvider._internal(
        (ref) => create(ref as AdminSectionLessonsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sectionId: sectionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonResponse>> createElement() {
    return _AdminSectionLessonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminSectionLessonsProvider && other.sectionId == sectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdminSectionLessonsRef
    on AutoDisposeFutureProviderRef<List<LessonResponse>> {
  /// The parameter `sectionId` of this provider.
  String get sectionId;
}

class _AdminSectionLessonsProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonResponse>>
    with AdminSectionLessonsRef {
  _AdminSectionLessonsProviderElement(super.provider);

  @override
  String get sectionId => (origin as AdminSectionLessonsProvider).sectionId;
}

String _$adminGroupDetailHash() => r'70ea27815066dc28a984a49e52d90bb9013c34b7';

/// See also [adminGroupDetail].
@ProviderFor(adminGroupDetail)
const adminGroupDetailProvider = AdminGroupDetailFamily();

/// See also [adminGroupDetail].
class AdminGroupDetailFamily extends Family<AsyncValue<GroupResponse>> {
  /// See also [adminGroupDetail].
  const AdminGroupDetailFamily();

  /// See also [adminGroupDetail].
  AdminGroupDetailProvider call(String id) {
    return AdminGroupDetailProvider(id);
  }

  @override
  AdminGroupDetailProvider getProviderOverride(
    covariant AdminGroupDetailProvider provider,
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
  String? get name => r'adminGroupDetailProvider';
}

/// See also [adminGroupDetail].
class AdminGroupDetailProvider
    extends AutoDisposeFutureProvider<GroupResponse> {
  /// See also [adminGroupDetail].
  AdminGroupDetailProvider(String id)
    : this._internal(
        (ref) => adminGroupDetail(ref as AdminGroupDetailRef, id),
        from: adminGroupDetailProvider,
        name: r'adminGroupDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminGroupDetailHash,
        dependencies: AdminGroupDetailFamily._dependencies,
        allTransitiveDependencies:
            AdminGroupDetailFamily._allTransitiveDependencies,
        id: id,
      );

  AdminGroupDetailProvider._internal(
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
    FutureOr<GroupResponse> Function(AdminGroupDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdminGroupDetailProvider._internal(
        (ref) => create(ref as AdminGroupDetailRef),
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
  AutoDisposeFutureProviderElement<GroupResponse> createElement() {
    return _AdminGroupDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminGroupDetailProvider && other.id == id;
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
mixin AdminGroupDetailRef on AutoDisposeFutureProviderRef<GroupResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AdminGroupDetailProviderElement
    extends AutoDisposeFutureProviderElement<GroupResponse>
    with AdminGroupDetailRef {
  _AdminGroupDetailProviderElement(super.provider);

  @override
  String get id => (origin as AdminGroupDetailProvider).id;
}

String _$teacherPickerListHash() => r'34e7f10cf5398bc82b47032b2451394e5cb0e1a7';

/// See also [teacherPickerList].
@ProviderFor(teacherPickerList)
const teacherPickerListProvider = TeacherPickerListFamily();

/// See also [teacherPickerList].
class TeacherPickerListFamily
    extends Family<AsyncValue<List<TeacherProfileResponse>>> {
  /// See also [teacherPickerList].
  const TeacherPickerListFamily();

  /// See also [teacherPickerList].
  TeacherPickerListProvider call(String search) {
    return TeacherPickerListProvider(search);
  }

  @override
  TeacherPickerListProvider getProviderOverride(
    covariant TeacherPickerListProvider provider,
  ) {
    return call(provider.search);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'teacherPickerListProvider';
}

/// See also [teacherPickerList].
class TeacherPickerListProvider
    extends AutoDisposeFutureProvider<List<TeacherProfileResponse>> {
  /// See also [teacherPickerList].
  TeacherPickerListProvider(String search)
    : this._internal(
        (ref) => teacherPickerList(ref as TeacherPickerListRef, search),
        from: teacherPickerListProvider,
        name: r'teacherPickerListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$teacherPickerListHash,
        dependencies: TeacherPickerListFamily._dependencies,
        allTransitiveDependencies:
            TeacherPickerListFamily._allTransitiveDependencies,
        search: search,
      );

  TeacherPickerListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String search;

  @override
  Override overrideWith(
    FutureOr<List<TeacherProfileResponse>> Function(
      TeacherPickerListRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TeacherPickerListProvider._internal(
        (ref) => create(ref as TeacherPickerListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TeacherProfileResponse>>
  createElement() {
    return _TeacherPickerListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TeacherPickerListProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TeacherPickerListRef
    on AutoDisposeFutureProviderRef<List<TeacherProfileResponse>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _TeacherPickerListProviderElement
    extends AutoDisposeFutureProviderElement<List<TeacherProfileResponse>>
    with TeacherPickerListRef {
  _TeacherPickerListProviderElement(super.provider);

  @override
  String get search => (origin as TeacherPickerListProvider).search;
}

String _$coursePickerListHash() => r'f5b9dc7cd85437f2e41a159770c5c9263825fb61';

/// See also [coursePickerList].
@ProviderFor(coursePickerList)
const coursePickerListProvider = CoursePickerListFamily();

/// See also [coursePickerList].
class CoursePickerListFamily extends Family<AsyncValue<List<CourseResponse>>> {
  /// See also [coursePickerList].
  const CoursePickerListFamily();

  /// See also [coursePickerList].
  CoursePickerListProvider call(String search) {
    return CoursePickerListProvider(search);
  }

  @override
  CoursePickerListProvider getProviderOverride(
    covariant CoursePickerListProvider provider,
  ) {
    return call(provider.search);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'coursePickerListProvider';
}

/// See also [coursePickerList].
class CoursePickerListProvider
    extends AutoDisposeFutureProvider<List<CourseResponse>> {
  /// See also [coursePickerList].
  CoursePickerListProvider(String search)
    : this._internal(
        (ref) => coursePickerList(ref as CoursePickerListRef, search),
        from: coursePickerListProvider,
        name: r'coursePickerListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$coursePickerListHash,
        dependencies: CoursePickerListFamily._dependencies,
        allTransitiveDependencies:
            CoursePickerListFamily._allTransitiveDependencies,
        search: search,
      );

  CoursePickerListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.search,
  }) : super.internal();

  final String search;

  @override
  Override overrideWith(
    FutureOr<List<CourseResponse>> Function(CoursePickerListRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CoursePickerListProvider._internal(
        (ref) => create(ref as CoursePickerListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        search: search,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CourseResponse>> createElement() {
    return _CoursePickerListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoursePickerListProvider && other.search == search;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, search.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoursePickerListRef
    on AutoDisposeFutureProviderRef<List<CourseResponse>> {
  /// The parameter `search` of this provider.
  String get search;
}

class _CoursePickerListProviderElement
    extends AutoDisposeFutureProviderElement<List<CourseResponse>>
    with CoursePickerListRef {
  _CoursePickerListProviderElement(super.provider);

  @override
  String get search => (origin as CoursePickerListProvider).search;
}

String _$adminOnlineCourseDetailHash() =>
    r'68a0dae91f1a84a4036fec4a5328928b2905e457';

/// See also [adminOnlineCourseDetail].
@ProviderFor(adminOnlineCourseDetail)
const adminOnlineCourseDetailProvider = AdminOnlineCourseDetailFamily();

/// See also [adminOnlineCourseDetail].
class AdminOnlineCourseDetailFamily
    extends Family<AsyncValue<OnlineCourseResponse>> {
  /// See also [adminOnlineCourseDetail].
  const AdminOnlineCourseDetailFamily();

  /// See also [adminOnlineCourseDetail].
  AdminOnlineCourseDetailProvider call(String courseId) {
    return AdminOnlineCourseDetailProvider(courseId);
  }

  @override
  AdminOnlineCourseDetailProvider getProviderOverride(
    covariant AdminOnlineCourseDetailProvider provider,
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
  String? get name => r'adminOnlineCourseDetailProvider';
}

/// See also [adminOnlineCourseDetail].
class AdminOnlineCourseDetailProvider
    extends AutoDisposeFutureProvider<OnlineCourseResponse> {
  /// See also [adminOnlineCourseDetail].
  AdminOnlineCourseDetailProvider(String courseId)
    : this._internal(
        (ref) => adminOnlineCourseDetail(
          ref as AdminOnlineCourseDetailRef,
          courseId,
        ),
        from: adminOnlineCourseDetailProvider,
        name: r'adminOnlineCourseDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminOnlineCourseDetailHash,
        dependencies: AdminOnlineCourseDetailFamily._dependencies,
        allTransitiveDependencies:
            AdminOnlineCourseDetailFamily._allTransitiveDependencies,
        courseId: courseId,
      );

  AdminOnlineCourseDetailProvider._internal(
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
    FutureOr<OnlineCourseResponse> Function(AdminOnlineCourseDetailRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdminOnlineCourseDetailProvider._internal(
        (ref) => create(ref as AdminOnlineCourseDetailRef),
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
    return _AdminOnlineCourseDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminOnlineCourseDetailProvider &&
        other.courseId == courseId;
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
mixin AdminOnlineCourseDetailRef
    on AutoDisposeFutureProviderRef<OnlineCourseResponse> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _AdminOnlineCourseDetailProviderElement
    extends AutoDisposeFutureProviderElement<OnlineCourseResponse>
    with AdminOnlineCourseDetailRef {
  _AdminOnlineCourseDetailProviderElement(super.provider);

  @override
  String get courseId => (origin as AdminOnlineCourseDetailProvider).courseId;
}

String _$adminRoleDetailHash() => r'6a69f71c681000da969e854b49e3f7937fc67a23';

/// See also [adminRoleDetail].
@ProviderFor(adminRoleDetail)
const adminRoleDetailProvider = AdminRoleDetailFamily();

/// See also [adminRoleDetail].
class AdminRoleDetailFamily extends Family<AsyncValue<Role>> {
  /// See also [adminRoleDetail].
  const AdminRoleDetailFamily();

  /// See also [adminRoleDetail].
  AdminRoleDetailProvider call(String id) {
    return AdminRoleDetailProvider(id);
  }

  @override
  AdminRoleDetailProvider getProviderOverride(
    covariant AdminRoleDetailProvider provider,
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
  String? get name => r'adminRoleDetailProvider';
}

/// See also [adminRoleDetail].
class AdminRoleDetailProvider extends AutoDisposeFutureProvider<Role> {
  /// See also [adminRoleDetail].
  AdminRoleDetailProvider(String id)
    : this._internal(
        (ref) => adminRoleDetail(ref as AdminRoleDetailRef, id),
        from: adminRoleDetailProvider,
        name: r'adminRoleDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminRoleDetailHash,
        dependencies: AdminRoleDetailFamily._dependencies,
        allTransitiveDependencies:
            AdminRoleDetailFamily._allTransitiveDependencies,
        id: id,
      );

  AdminRoleDetailProvider._internal(
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
    FutureOr<Role> Function(AdminRoleDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdminRoleDetailProvider._internal(
        (ref) => create(ref as AdminRoleDetailRef),
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
  AutoDisposeFutureProviderElement<Role> createElement() {
    return _AdminRoleDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminRoleDetailProvider && other.id == id;
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
mixin AdminRoleDetailRef on AutoDisposeFutureProviderRef<Role> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AdminRoleDetailProviderElement
    extends AutoDisposeFutureProviderElement<Role>
    with AdminRoleDetailRef {
  _AdminRoleDetailProviderElement(super.provider);

  @override
  String get id => (origin as AdminRoleDetailProvider).id;
}

String _$adminUsersNotifierHash() =>
    r'ca6e29cf68974fb00f8c9ed6031bd00e0ab6d22a';

/// See also [AdminUsersNotifier].
@ProviderFor(AdminUsersNotifier)
final adminUsersNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AdminUsersNotifier,
      List<UserPreview>
    >.internal(
      AdminUsersNotifier.new,
      name: r'adminUsersNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminUsersNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminUsersNotifier = AutoDisposeAsyncNotifier<List<UserPreview>>;
String _$adminCoursesNotifierHash() =>
    r'c3e48884f69ae0d9fe5a3c570aef2a3fa4751c31';

/// See also [AdminCoursesNotifier].
@ProviderFor(AdminCoursesNotifier)
final adminCoursesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AdminCoursesNotifier,
      List<CourseResponse>
    >.internal(
      AdminCoursesNotifier.new,
      name: r'adminCoursesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminCoursesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminCoursesNotifier = AutoDisposeAsyncNotifier<List<CourseResponse>>;
String _$adminGroupsNotifierHash() =>
    r'a5cb6fe893d67ee07a0bdfdcd5947dd8690cc3a4';

/// See also [AdminGroupsNotifier].
@ProviderFor(AdminGroupsNotifier)
final adminGroupsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AdminGroupsNotifier,
      List<GroupResponse>
    >.internal(
      AdminGroupsNotifier.new,
      name: r'adminGroupsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminGroupsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminGroupsNotifier = AutoDisposeAsyncNotifier<List<GroupResponse>>;
String _$adminOnlineCoursesNotifierHash() =>
    r'5a3ca43c36288cceefa538b94bcb76ae0bbcb7cd';

/// See also [AdminOnlineCoursesNotifier].
@ProviderFor(AdminOnlineCoursesNotifier)
final adminOnlineCoursesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AdminOnlineCoursesNotifier,
      List<OnlineCourseSummaryResponse>
    >.internal(
      AdminOnlineCoursesNotifier.new,
      name: r'adminOnlineCoursesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminOnlineCoursesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminOnlineCoursesNotifier =
    AutoDisposeAsyncNotifier<List<OnlineCourseSummaryResponse>>;
String _$adminRolesNotifierHash() =>
    r'e510a1dc876615af9a739441e45c9c9b2cc2af7a';

/// See also [AdminRolesNotifier].
@ProviderFor(AdminRolesNotifier)
final adminRolesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AdminRolesNotifier, List<Role>>.internal(
      AdminRolesNotifier.new,
      name: r'adminRolesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminRolesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminRolesNotifier = AutoDisposeAsyncNotifier<List<Role>>;
String _$adminPermissionsNotifierHash() =>
    r'7c75190ab326d88fbd50aae01d6b941c43e3d026';

/// See also [AdminPermissionsNotifier].
@ProviderFor(AdminPermissionsNotifier)
final adminPermissionsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AdminPermissionsNotifier,
      List<Permission>
    >.internal(
      AdminPermissionsNotifier.new,
      name: r'adminPermissionsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$adminPermissionsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AdminPermissionsNotifier = AutoDisposeAsyncNotifier<List<Permission>>;
String _$adminUserRolesNotifierHash() =>
    r'7c0e7d5119a7ed3d445e3ce6d647147c850573dd';

abstract class _$AdminUserRolesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<Role>> {
  late final String userId;

  FutureOr<List<Role>> build(String userId);
}

/// See also [AdminUserRolesNotifier].
@ProviderFor(AdminUserRolesNotifier)
const adminUserRolesNotifierProvider = AdminUserRolesNotifierFamily();

/// See also [AdminUserRolesNotifier].
class AdminUserRolesNotifierFamily extends Family<AsyncValue<List<Role>>> {
  /// See also [AdminUserRolesNotifier].
  const AdminUserRolesNotifierFamily();

  /// See also [AdminUserRolesNotifier].
  AdminUserRolesNotifierProvider call(String userId) {
    return AdminUserRolesNotifierProvider(userId);
  }

  @override
  AdminUserRolesNotifierProvider getProviderOverride(
    covariant AdminUserRolesNotifierProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'adminUserRolesNotifierProvider';
}

/// See also [AdminUserRolesNotifier].
class AdminUserRolesNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          AdminUserRolesNotifier,
          List<Role>
        > {
  /// See also [AdminUserRolesNotifier].
  AdminUserRolesNotifierProvider(String userId)
    : this._internal(
        () => AdminUserRolesNotifier()..userId = userId,
        from: adminUserRolesNotifierProvider,
        name: r'adminUserRolesNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$adminUserRolesNotifierHash,
        dependencies: AdminUserRolesNotifierFamily._dependencies,
        allTransitiveDependencies:
            AdminUserRolesNotifierFamily._allTransitiveDependencies,
        userId: userId,
      );

  AdminUserRolesNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<Role>> runNotifierBuild(
    covariant AdminUserRolesNotifier notifier,
  ) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(AdminUserRolesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AdminUserRolesNotifierProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AdminUserRolesNotifier, List<Role>>
  createElement() {
    return _AdminUserRolesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminUserRolesNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AdminUserRolesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<List<Role>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _AdminUserRolesNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          AdminUserRolesNotifier,
          List<Role>
        >
    with AdminUserRolesNotifierRef {
  _AdminUserRolesNotifierProviderElement(super.provider);

  @override
  String get userId => (origin as AdminUserRolesNotifierProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
