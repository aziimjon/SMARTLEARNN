// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupDetailHash() => r'e9d7a36f6f29d64ee8328a5e232a2b138445088c';

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

/// See also [groupDetail].
@ProviderFor(groupDetail)
const groupDetailProvider = GroupDetailFamily();

/// See also [groupDetail].
class GroupDetailFamily extends Family<AsyncValue<GroupResponse>> {
  /// See also [groupDetail].
  const GroupDetailFamily();

  /// See also [groupDetail].
  GroupDetailProvider call(String id) {
    return GroupDetailProvider(id);
  }

  @override
  GroupDetailProvider getProviderOverride(
    covariant GroupDetailProvider provider,
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
  String? get name => r'groupDetailProvider';
}

/// See also [groupDetail].
class GroupDetailProvider extends AutoDisposeFutureProvider<GroupResponse> {
  /// See also [groupDetail].
  GroupDetailProvider(String id)
    : this._internal(
        (ref) => groupDetail(ref as GroupDetailRef, id),
        from: groupDetailProvider,
        name: r'groupDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupDetailHash,
        dependencies: GroupDetailFamily._dependencies,
        allTransitiveDependencies: GroupDetailFamily._allTransitiveDependencies,
        id: id,
      );

  GroupDetailProvider._internal(
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
    FutureOr<GroupResponse> Function(GroupDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupDetailProvider._internal(
        (ref) => create(ref as GroupDetailRef),
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
    return _GroupDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupDetailProvider && other.id == id;
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
mixin GroupDetailRef on AutoDisposeFutureProviderRef<GroupResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GroupDetailProviderElement
    extends AutoDisposeFutureProviderElement<GroupResponse>
    with GroupDetailRef {
  _GroupDetailProviderElement(super.provider);

  @override
  String get id => (origin as GroupDetailProvider).id;
}

String _$groupSchedulesHash() => r'0774eb0a7b2de3bb593ea366e27b4838a46ff5d3';

/// See also [groupSchedules].
@ProviderFor(groupSchedules)
const groupSchedulesProvider = GroupSchedulesFamily();

/// See also [groupSchedules].
class GroupSchedulesFamily extends Family<AsyncValue<List<ScheduleResponse>>> {
  /// See also [groupSchedules].
  const GroupSchedulesFamily();

  /// See also [groupSchedules].
  GroupSchedulesProvider call(String groupId) {
    return GroupSchedulesProvider(groupId);
  }

  @override
  GroupSchedulesProvider getProviderOverride(
    covariant GroupSchedulesProvider provider,
  ) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupSchedulesProvider';
}

/// See also [groupSchedules].
class GroupSchedulesProvider
    extends AutoDisposeFutureProvider<List<ScheduleResponse>> {
  /// See also [groupSchedules].
  GroupSchedulesProvider(String groupId)
    : this._internal(
        (ref) => groupSchedules(ref as GroupSchedulesRef, groupId),
        from: groupSchedulesProvider,
        name: r'groupSchedulesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupSchedulesHash,
        dependencies: GroupSchedulesFamily._dependencies,
        allTransitiveDependencies:
            GroupSchedulesFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupSchedulesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<List<ScheduleResponse>> Function(GroupSchedulesRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupSchedulesProvider._internal(
        (ref) => create(ref as GroupSchedulesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ScheduleResponse>> createElement() {
    return _GroupSchedulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupSchedulesProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupSchedulesRef
    on AutoDisposeFutureProviderRef<List<ScheduleResponse>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupSchedulesProviderElement
    extends AutoDisposeFutureProviderElement<List<ScheduleResponse>>
    with GroupSchedulesRef {
  _GroupSchedulesProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupSchedulesProvider).groupId;
}

String _$groupSessionsHash() => r'77c00e335deedae0f5611b116fe7ddf62cc33470';

/// See also [groupSessions].
@ProviderFor(groupSessions)
const groupSessionsProvider = GroupSessionsFamily();

/// See also [groupSessions].
class GroupSessionsFamily
    extends Family<AsyncValue<List<LessonSessionResponse>>> {
  /// See also [groupSessions].
  const GroupSessionsFamily();

  /// See also [groupSessions].
  GroupSessionsProvider call(String groupId) {
    return GroupSessionsProvider(groupId);
  }

  @override
  GroupSessionsProvider getProviderOverride(
    covariant GroupSessionsProvider provider,
  ) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupSessionsProvider';
}

/// See also [groupSessions].
class GroupSessionsProvider
    extends AutoDisposeFutureProvider<List<LessonSessionResponse>> {
  /// See also [groupSessions].
  GroupSessionsProvider(String groupId)
    : this._internal(
        (ref) => groupSessions(ref as GroupSessionsRef, groupId),
        from: groupSessionsProvider,
        name: r'groupSessionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupSessionsHash,
        dependencies: GroupSessionsFamily._dependencies,
        allTransitiveDependencies:
            GroupSessionsFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupSessionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<List<LessonSessionResponse>> Function(GroupSessionsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupSessionsProvider._internal(
        (ref) => create(ref as GroupSessionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonSessionResponse>>
  createElement() {
    return _GroupSessionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupSessionsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupSessionsRef
    on AutoDisposeFutureProviderRef<List<LessonSessionResponse>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupSessionsProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonSessionResponse>>
    with GroupSessionsRef {
  _GroupSessionsProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupSessionsProvider).groupId;
}

String _$groupUpcomingSessionsHash() =>
    r'9b42fb0b96d3b50f11913de5caf9512ba277697d';

/// See also [groupUpcomingSessions].
@ProviderFor(groupUpcomingSessions)
const groupUpcomingSessionsProvider = GroupUpcomingSessionsFamily();

/// See also [groupUpcomingSessions].
class GroupUpcomingSessionsFamily
    extends Family<AsyncValue<List<LessonSessionResponse>>> {
  /// See also [groupUpcomingSessions].
  const GroupUpcomingSessionsFamily();

  /// See also [groupUpcomingSessions].
  GroupUpcomingSessionsProvider call(String groupId) {
    return GroupUpcomingSessionsProvider(groupId);
  }

  @override
  GroupUpcomingSessionsProvider getProviderOverride(
    covariant GroupUpcomingSessionsProvider provider,
  ) {
    return call(provider.groupId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'groupUpcomingSessionsProvider';
}

/// See also [groupUpcomingSessions].
class GroupUpcomingSessionsProvider
    extends AutoDisposeFutureProvider<List<LessonSessionResponse>> {
  /// See also [groupUpcomingSessions].
  GroupUpcomingSessionsProvider(String groupId)
    : this._internal(
        (ref) =>
            groupUpcomingSessions(ref as GroupUpcomingSessionsRef, groupId),
        from: groupUpcomingSessionsProvider,
        name: r'groupUpcomingSessionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupUpcomingSessionsHash,
        dependencies: GroupUpcomingSessionsFamily._dependencies,
        allTransitiveDependencies:
            GroupUpcomingSessionsFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupUpcomingSessionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  Override overrideWith(
    FutureOr<List<LessonSessionResponse>> Function(
      GroupUpcomingSessionsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupUpcomingSessionsProvider._internal(
        (ref) => create(ref as GroupUpcomingSessionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonSessionResponse>>
  createElement() {
    return _GroupUpcomingSessionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupUpcomingSessionsProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GroupUpcomingSessionsRef
    on AutoDisposeFutureProviderRef<List<LessonSessionResponse>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupUpcomingSessionsProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonSessionResponse>>
    with GroupUpcomingSessionsRef {
  _GroupUpcomingSessionsProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupUpcomingSessionsProvider).groupId;
}

String _$teacherGroupsNotifierHash() =>
    r'9f6c0902c3bd9c7cf1fda5421225a2b5519825c6';

/// See also [TeacherGroupsNotifier].
@ProviderFor(TeacherGroupsNotifier)
final teacherGroupsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      TeacherGroupsNotifier,
      List<GroupResponse>
    >.internal(
      TeacherGroupsNotifier.new,
      name: r'teacherGroupsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$teacherGroupsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$TeacherGroupsNotifier = AutoDisposeAsyncNotifier<List<GroupResponse>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
