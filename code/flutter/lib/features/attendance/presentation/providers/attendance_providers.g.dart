// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weeklyAttendanceHash() => r'48cd9186282c8c4f858658b5abff5b6195d51a62';

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

/// See also [weeklyAttendance].
@ProviderFor(weeklyAttendance)
const weeklyAttendanceProvider = WeeklyAttendanceFamily();

/// See also [weeklyAttendance].
class WeeklyAttendanceFamily
    extends Family<AsyncValue<List<AttendanceResponse>>> {
  /// See also [weeklyAttendance].
  const WeeklyAttendanceFamily();

  /// See also [weeklyAttendance].
  WeeklyAttendanceProvider call(DateTime weekStart) {
    return WeeklyAttendanceProvider(weekStart);
  }

  @override
  WeeklyAttendanceProvider getProviderOverride(
    covariant WeeklyAttendanceProvider provider,
  ) {
    return call(provider.weekStart);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weeklyAttendanceProvider';
}

/// See also [weeklyAttendance].
class WeeklyAttendanceProvider
    extends AutoDisposeFutureProvider<List<AttendanceResponse>> {
  /// See also [weeklyAttendance].
  WeeklyAttendanceProvider(DateTime weekStart)
    : this._internal(
        (ref) => weeklyAttendance(ref as WeeklyAttendanceRef, weekStart),
        from: weeklyAttendanceProvider,
        name: r'weeklyAttendanceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weeklyAttendanceHash,
        dependencies: WeeklyAttendanceFamily._dependencies,
        allTransitiveDependencies:
            WeeklyAttendanceFamily._allTransitiveDependencies,
        weekStart: weekStart,
      );

  WeeklyAttendanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weekStart,
  }) : super.internal();

  final DateTime weekStart;

  @override
  Override overrideWith(
    FutureOr<List<AttendanceResponse>> Function(WeeklyAttendanceRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeeklyAttendanceProvider._internal(
        (ref) => create(ref as WeeklyAttendanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weekStart: weekStart,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AttendanceResponse>> createElement() {
    return _WeeklyAttendanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeeklyAttendanceProvider && other.weekStart == weekStart;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weekStart.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeeklyAttendanceRef
    on AutoDisposeFutureProviderRef<List<AttendanceResponse>> {
  /// The parameter `weekStart` of this provider.
  DateTime get weekStart;
}

class _WeeklyAttendanceProviderElement
    extends AutoDisposeFutureProviderElement<List<AttendanceResponse>>
    with WeeklyAttendanceRef {
  _WeeklyAttendanceProviderElement(super.provider);

  @override
  DateTime get weekStart => (origin as WeeklyAttendanceProvider).weekStart;
}

String _$sessionForAttendanceHash() =>
    r'4a51168b5b55094c416172f4741aeb6f8b13b065';

/// See also [sessionForAttendance].
@ProviderFor(sessionForAttendance)
const sessionForAttendanceProvider = SessionForAttendanceFamily();

/// See also [sessionForAttendance].
class SessionForAttendanceFamily
    extends Family<AsyncValue<LessonSessionResponse>> {
  /// See also [sessionForAttendance].
  const SessionForAttendanceFamily();

  /// See also [sessionForAttendance].
  SessionForAttendanceProvider call(String sessionId) {
    return SessionForAttendanceProvider(sessionId);
  }

  @override
  SessionForAttendanceProvider getProviderOverride(
    covariant SessionForAttendanceProvider provider,
  ) {
    return call(provider.sessionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sessionForAttendanceProvider';
}

/// See also [sessionForAttendance].
class SessionForAttendanceProvider
    extends AutoDisposeFutureProvider<LessonSessionResponse> {
  /// See also [sessionForAttendance].
  SessionForAttendanceProvider(String sessionId)
    : this._internal(
        (ref) =>
            sessionForAttendance(ref as SessionForAttendanceRef, sessionId),
        from: sessionForAttendanceProvider,
        name: r'sessionForAttendanceProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sessionForAttendanceHash,
        dependencies: SessionForAttendanceFamily._dependencies,
        allTransitiveDependencies:
            SessionForAttendanceFamily._allTransitiveDependencies,
        sessionId: sessionId,
      );

  SessionForAttendanceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<LessonSessionResponse> Function(SessionForAttendanceRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SessionForAttendanceProvider._internal(
        (ref) => create(ref as SessionForAttendanceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LessonSessionResponse> createElement() {
    return _SessionForAttendanceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionForAttendanceProvider &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SessionForAttendanceRef
    on AutoDisposeFutureProviderRef<LessonSessionResponse> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SessionForAttendanceProviderElement
    extends AutoDisposeFutureProviderElement<LessonSessionResponse>
    with SessionForAttendanceRef {
  _SessionForAttendanceProviderElement(super.provider);

  @override
  String get sessionId => (origin as SessionForAttendanceProvider).sessionId;
}

String _$sessionAttendancesHash() =>
    r'fc35553ddaa261a89e8a5a6ee4c93fa627e4e2f3';

/// See also [sessionAttendances].
@ProviderFor(sessionAttendances)
const sessionAttendancesProvider = SessionAttendancesFamily();

/// See also [sessionAttendances].
class SessionAttendancesFamily
    extends Family<AsyncValue<List<AttendanceResponse>>> {
  /// See also [sessionAttendances].
  const SessionAttendancesFamily();

  /// See also [sessionAttendances].
  SessionAttendancesProvider call(String sessionId) {
    return SessionAttendancesProvider(sessionId);
  }

  @override
  SessionAttendancesProvider getProviderOverride(
    covariant SessionAttendancesProvider provider,
  ) {
    return call(provider.sessionId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sessionAttendancesProvider';
}

/// See also [sessionAttendances].
class SessionAttendancesProvider
    extends AutoDisposeFutureProvider<List<AttendanceResponse>> {
  /// See also [sessionAttendances].
  SessionAttendancesProvider(String sessionId)
    : this._internal(
        (ref) => sessionAttendances(ref as SessionAttendancesRef, sessionId),
        from: sessionAttendancesProvider,
        name: r'sessionAttendancesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sessionAttendancesHash,
        dependencies: SessionAttendancesFamily._dependencies,
        allTransitiveDependencies:
            SessionAttendancesFamily._allTransitiveDependencies,
        sessionId: sessionId,
      );

  SessionAttendancesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
  }) : super.internal();

  final String sessionId;

  @override
  Override overrideWith(
    FutureOr<List<AttendanceResponse>> Function(SessionAttendancesRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SessionAttendancesProvider._internal(
        (ref) => create(ref as SessionAttendancesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AttendanceResponse>> createElement() {
    return _SessionAttendancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SessionAttendancesProvider && other.sessionId == sessionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SessionAttendancesRef
    on AutoDisposeFutureProviderRef<List<AttendanceResponse>> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;
}

class _SessionAttendancesProviderElement
    extends AutoDisposeFutureProviderElement<List<AttendanceResponse>>
    with SessionAttendancesRef {
  _SessionAttendancesProviderElement(super.provider);

  @override
  String get sessionId => (origin as SessionAttendancesProvider).sessionId;
}

String _$groupStudentRosterHash() =>
    r'ef8e5cf1bf4484e1f87a9f41112af303932a3fdf';

/// See also [groupStudentRoster].
@ProviderFor(groupStudentRoster)
const groupStudentRosterProvider = GroupStudentRosterFamily();

/// See also [groupStudentRoster].
class GroupStudentRosterFamily extends Family<AsyncValue<List<StudentEntry>>> {
  /// See also [groupStudentRoster].
  const GroupStudentRosterFamily();

  /// See also [groupStudentRoster].
  GroupStudentRosterProvider call(String groupId) {
    return GroupStudentRosterProvider(groupId);
  }

  @override
  GroupStudentRosterProvider getProviderOverride(
    covariant GroupStudentRosterProvider provider,
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
  String? get name => r'groupStudentRosterProvider';
}

/// See also [groupStudentRoster].
class GroupStudentRosterProvider
    extends AutoDisposeFutureProvider<List<StudentEntry>> {
  /// See also [groupStudentRoster].
  GroupStudentRosterProvider(String groupId)
    : this._internal(
        (ref) => groupStudentRoster(ref as GroupStudentRosterRef, groupId),
        from: groupStudentRosterProvider,
        name: r'groupStudentRosterProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$groupStudentRosterHash,
        dependencies: GroupStudentRosterFamily._dependencies,
        allTransitiveDependencies:
            GroupStudentRosterFamily._allTransitiveDependencies,
        groupId: groupId,
      );

  GroupStudentRosterProvider._internal(
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
    FutureOr<List<StudentEntry>> Function(GroupStudentRosterRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupStudentRosterProvider._internal(
        (ref) => create(ref as GroupStudentRosterRef),
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
  AutoDisposeFutureProviderElement<List<StudentEntry>> createElement() {
    return _GroupStudentRosterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupStudentRosterProvider && other.groupId == groupId;
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
mixin GroupStudentRosterRef
    on AutoDisposeFutureProviderRef<List<StudentEntry>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupStudentRosterProviderElement
    extends AutoDisposeFutureProviderElement<List<StudentEntry>>
    with GroupStudentRosterRef {
  _GroupStudentRosterProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupStudentRosterProvider).groupId;
}

String _$attendanceHistoryNotifierHash() =>
    r'f0ba9453e33b6b12d74e794ad1373f1615113d93';

/// See also [AttendanceHistoryNotifier].
@ProviderFor(AttendanceHistoryNotifier)
final attendanceHistoryNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      AttendanceHistoryNotifier,
      List<AttendanceResponse>
    >.internal(
      AttendanceHistoryNotifier.new,
      name: r'attendanceHistoryNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$attendanceHistoryNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AttendanceHistoryNotifier =
    AutoDisposeAsyncNotifier<List<AttendanceResponse>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
