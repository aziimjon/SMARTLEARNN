import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:smartlearn/l10n/app_localizations.dart';

import '../../../../core/router/routes.dart';
import '../../../attendance/data/models/attendance_response.dart';
import '../../../attendance/presentation/providers/attendance_providers.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../online_courses/data/models/online_course_summary_response.dart';
import '../../../online_courses/presentation/providers/online_course_providers.dart';

class StudentDashboardScreen extends ConsumerStatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  ConsumerState<StudentDashboardScreen> createState() =>
      _StudentDashboardScreenState();
}

class _StudentDashboardScreenState
    extends ConsumerState<StudentDashboardScreen> {
  late final DateTime _weekStart;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _weekStart =
        DateTime(now.year, now.month, now.day - (now.weekday - 1));
  }

  String _greeting(AppL10n l) {
    final h = DateTime.now().hour;
    if (h < 12) return l.greetingMorning;
    if (h < 17) return l.greetingAfternoon;
    return l.greetingEvening;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final user = ref.watch(authNotifierProvider).user;
    final onlineAsync = ref.watch(onlineCoursesNotifierProvider);
    final scheduleAsync = ref.watch(weeklyAttendanceProvider(_weekStart));
    final todayStr =
        DateFormat('EEEE, d MMMM', locale).format(DateTime.now());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: CustomScrollView(
        slivers: [
          // ── Hero Header ──────────────────────────────────────────────────
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            floating: false,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.indigo.shade800,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: _HeroHeader(
                greeting: _greeting(l),
                userName: user?.firstName ?? '',
                dateStr: todayStr,
              ),
            ),
            title: Text(
              l.dashboardTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined,
                    color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),

          // ── Stats Row ────────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _StatsRow(
                l: l,
                onlineAsync: onlineAsync,
                scheduleAsync: scheduleAsync,
              ),
            ),
          ),

          // ── Сегодняшние занятия ──────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _TodaySection(l: l, scheduleAsync: scheduleAsync),
            ),
          ),

          // ── Онлайн-курсы ─────────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
            sliver: SliverToBoxAdapter(
              child: _OnlineCoursesSection(l: l, onlineAsync: onlineAsync),
            ),
          ),

          // ── ИИ-тьютор тизер ──────────────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
            sliver: SliverToBoxAdapter(child: _AiTeaserCard(l: l)),
          ),
        ],
      ),
    );
  }
}

// ── Hero Header ────────────────────────────────────────────────────────────────

class _HeroHeader extends StatelessWidget {
  final String greeting;
  final String userName;
  final String dateStr;

  const _HeroHeader({
    required this.greeting,
    required this.userName,
    required this.dateStr,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.indigo.shade900,
            Colors.indigo.shade700,
            Colors.purple.shade700,
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$greeting! 👋',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined,
                      color: Colors.white54, size: 13),
                  const SizedBox(width: 5),
                  Text(
                    dateStr,
                    style: const TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Stats Row ──────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  final AppL10n l;
  final AsyncValue<List<OnlineCourseSummaryResponse>> onlineAsync;
  final AsyncValue<List<AttendanceResponse>> scheduleAsync;

  const _StatsRow({
    required this.l,
    required this.onlineAsync,
    required this.scheduleAsync,
  });

  @override
  Widget build(BuildContext context) {
    final onlineCount = onlineAsync.valueOrNull?.length ?? 0;
    final today = DateTime.now();
    final allThisWeek = scheduleAsync.valueOrNull ?? [];
    final todayCount = allThisWeek.where((a) {
      final dt = DateTime.tryParse(a.lessonStartTime);
      if (dt == null) return false;
      return dt.year == today.year &&
          dt.month == today.month &&
          dt.day == today.day;
    }).length;
    final presentCount =
        allThisWeek.where((a) => a.status == 'PRESENT').length;
    final attendancePct = allThisWeek.isEmpty
        ? null
        : (presentCount / allThisWeek.length * 100).round();

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.play_circle_outline,
            iconColor: Colors.indigo,
            label: l.statsOnlineCourses,
            value: '$onlineCount',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            icon: Icons.today_outlined,
            iconColor: Colors.teal,
            label: l.statsTodayClasses,
            value: todayCount == 0 ? '—' : '$todayCount',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            icon: Icons.fact_check_outlined,
            iconColor: Colors.deepOrange,
            label: l.statsAttendance,
            value: attendancePct == null ? '—' : '$attendancePct%',
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Today's Classes ────────────────────────────────────────────────────────────

class _TodaySection extends StatelessWidget {
  final AppL10n l;
  final AsyncValue<List<AttendanceResponse>> scheduleAsync;

  const _TodaySection({required this.l, required this.scheduleAsync});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: l.todayClasses, icon: Icons.schedule_outlined),
        const SizedBox(height: 12),
        scheduleAsync.when(
          loading: () => const _SkeletonCard(height: 80),
          error: (_, __) => _EmptyState(
            icon: Icons.error_outline,
            message: l.scheduleLoadError,
          ),
          data: (records) {
            final today = DateTime.now();
            final todayRecords = records.where((a) {
              final dt = DateTime.tryParse(a.lessonStartTime);
              if (dt == null) return false;
              return dt.year == today.year &&
                  dt.month == today.month &&
                  dt.day == today.day;
            }).toList()
              ..sort((a, b) {
                final ta = DateTime.tryParse(a.lessonStartTime);
                final tb = DateTime.tryParse(b.lessonStartTime);
                if (ta == null || tb == null) return 0;
                return ta.compareTo(tb);
              });

            if (todayRecords.isEmpty) {
              return _EmptyState(
                icon: Icons.free_breakfast_outlined,
                message: l.todayNoClassesFull,
              );
            }
            return Column(
              children: todayRecords
                  .take(3)
                  .map((a) => _TodayClassCard(attendance: a, l: l))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _TodayClassCard extends StatelessWidget {
  final AttendanceResponse attendance;
  final AppL10n l;

  const _TodayClassCard({required this.attendance, required this.l});

  Color _statusColor() => switch (attendance.status) {
        'PRESENT' => Colors.green,
        'LATE' => Colors.orange,
        'ABSENT' => Colors.red,
        'EXCUSED' => Colors.blue,
        _ => Colors.grey,
      };

  String _statusLabel() => switch (attendance.status) {
        'PRESENT' => l.statusPresent,
        'LATE' => l.statusLate,
        'ABSENT' => l.statusAbsent,
        'EXCUSED' => l.statusExcused,
        _ => attendance.status,
      };

  String _formatTime(String raw) {
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw;
    return DateFormat('HH:mm').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _formatTime(attendance.lessonStartTime),
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 14),
                ),
                Text(
                  _formatTime(attendance.lessonEndTime),
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attendance.lessonTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    attendance.groupName,
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _statusLabel(),
                style: TextStyle(
                  fontSize: 11,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Online Courses Section ─────────────────────────────────────────────────────

class _OnlineCoursesSection extends StatelessWidget {
  final AppL10n l;
  final AsyncValue<List<OnlineCourseSummaryResponse>> onlineAsync;

  const _OnlineCoursesSection(
      {required this.l, required this.onlineAsync});

  Color _levelColor(String level) => switch (level) {
        'BEGINNER' => Colors.green,
        'INTERMEDIATE' => Colors.orange,
        'ADVANCED' => Colors.red,
        _ => Colors.grey,
      };

  String _levelLabel(String level) => switch (level) {
        'BEGINNER' => l.levelBeginner,
        'INTERMEDIATE' => l.levelIntermediate,
        'ADVANCED' => l.levelAdvanced,
        _ => level,
      };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(
            title: l.onlineCourses, icon: Icons.play_circle_outline),
        const SizedBox(height: 12),
        onlineAsync.when(
          loading: () => const _SkeletonCard(height: 180),
          error: (_, __) => const SizedBox.shrink(),
          data: (courses) {
            if (courses.isEmpty) {
              return _EmptyState(
                icon: Icons.play_circle_outline,
                message: l.onlineCoursesEmpty,
              );
            }
            return Column(
              children: courses
                  .take(3)
                  .map(
                    (c) => _OnlineCourseCard(
                      course: c,
                      levelColor: _levelColor(c.level),
                      levelLabel: _levelLabel(c.level),
                      durationLabel: c.estimatedDurationInMinutes != null
                          ? l.durationMinutes(
                              c.estimatedDurationInMinutes!)
                          : null,
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _OnlineCourseCard extends StatelessWidget {
  final OnlineCourseSummaryResponse course;
  final Color levelColor;
  final String levelLabel;
  final String? durationLabel;

  const _OnlineCourseCard({
    required this.course,
    required this.levelColor,
    required this.levelLabel,
    this.durationLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.push(Routes.studentOnlineCourseDetail(course.id)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    levelColor.withValues(alpha: 0.7),
                    levelColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.play_arrow_rounded,
                  color: Colors.white, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: levelColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          levelLabel,
                          style: TextStyle(
                            fontSize: 11,
                            color: levelColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (durationLabel != null) ...[
                        const SizedBox(width: 8),
                        Icon(Icons.access_time,
                            size: 12,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant),
                        const SizedBox(width: 3),
                        Text(
                          durationLabel!,
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

// ── AI Teaser Card ─────────────────────────────────────────────────────────────

class _AiTeaserCard extends StatelessWidget {
  final AppL10n l;
  const _AiTeaserCard({required this.l});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade800, Colors.indigo.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withValues(alpha: 0.35),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    l.aiTeaserBadge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l.aiTeaserTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  l.aiTeaserPersonalTutor,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.auto_awesome,
                color: Colors.white, size: 34),
          ),
        ],
      ),
    );
  }
}

// ── Shared helpers ─────────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;

  const _EmptyState({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 10),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  final double height;
  const _SkeletonCard({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
