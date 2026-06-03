import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/router/routes.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../schedule/data/models/lesson_session_response.dart';
import '../../data/models/group_response.dart';
import '../../data/models/schedule_response.dart';
import '../providers/group_providers.dart';

class GroupDetailScreen extends ConsumerWidget {
  final String groupId;

  const GroupDetailScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupAsync = ref.watch(groupDetailProvider(groupId));

    return groupAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Группа')),
        body: const LoadingWidget(),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: const Text('Группа')),
        body: AppErrorWidget(message: e.toString()),
      ),
      data: (group) => _GroupDetailTabs(group: group, groupId: groupId),
    );
  }
}

class _GroupDetailTabs extends ConsumerWidget {
  final GroupResponse group;
  final String groupId;

  const _GroupDetailTabs({required this.group, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(group.name),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Расписание'),
              Tab(text: 'Занятия'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ScheduleTab(group: group, groupId: groupId),
            _SessionsTab(groupId: groupId),
          ],
        ),
      ),
    );
  }
}

// ─── TAB 1: Расписание ────────────────────────────────────────────────────────

class _ScheduleTab extends ConsumerWidget {
  final GroupResponse group;
  final String groupId;

  const _ScheduleTab({required this.group, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesAsync = ref.watch(groupSchedulesProvider(groupId));

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _GroupInfoCard(group: group),
        const SizedBox(height: 16),
        Text(
          'Расписание',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        schedulesAsync.when(
          loading: () => const LoadingWidget(),
          error: (e, _) => AppErrorWidget(message: e.toString()),
          data: (schedules) {
            if (schedules.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Расписание не задано'),
                ),
              );
            }
            final sorted = List<ScheduleResponse>.from(schedules)
              ..sort((a, b) =>
                  _dayOrder(a.dayOfWeek).compareTo(_dayOrder(b.dayOfWeek)));
            return Column(
              children: sorted.map((s) => _ScheduleRow(schedule: s)).toList(),
            );
          },
        ),
      ],
    );
  }

  int _dayOrder(String day) {
    const order = {
      'MONDAY': 0, 'TUESDAY': 1, 'WEDNESDAY': 2, 'THURSDAY': 3,
      'FRIDAY': 4, 'SATURDAY': 5, 'SUNDAY': 6,
    };
    return order[day] ?? 99;
  }
}

// ─── TAB 2: Занятия (Lesson Sessions) ────────────────────────────────────────

class _SessionsTab extends ConsumerWidget {
  final String groupId;

  const _SessionsTab({required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(groupSessionsProvider(groupId));

    return sessionsAsync.when(
      loading: () => const LoadingWidget(),
      error: (e, _) => AppErrorWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(groupSessionsProvider(groupId)),
      ),
      data: (sessions) {
        if (sessions.isEmpty) {
          return const Center(child: Text('Нет занятий'));
        }
        final sorted = List<LessonSessionResponse>.from(sessions)
          ..sort((a, b) => b.startTime.compareTo(a.startTime));
        return RefreshIndicator(
          onRefresh: () async => ref.invalidate(groupSessionsProvider(groupId)),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sorted.length,
            itemBuilder: (context, index) => _SessionCard(
              session: sorted[index],
              onTap: () => context.push(
                Routes.teacherMarkAttendance(sorted[index].id),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─── Widgets ──────────────────────────────────────────────────────────────────

class _GroupInfoCard extends StatelessWidget {
  final GroupResponse group;

  const _GroupInfoCard({required this.group});

  Color _statusColor(BuildContext context) => switch (group.status) {
        'ACTIVE' => Colors.green,
        'FORMING' => Colors.orange,
        'FINISHED' => Colors.grey,
        'CANCELLED' => Colors.red,
        _ => Theme.of(context).colorScheme.onSurfaceVariant,
      };

  String get _statusLabel => switch (group.status) {
        'ACTIVE' => 'Активна',
        'FORMING' => 'Формируется',
        'FINISHED' => 'Завершена',
        'CANCELLED' => 'Отменена',
        _ => group.status,
      };

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    group.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    _statusLabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: statusColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              group.courseName,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const Divider(height: 20),
            _InfoRow(
              icon: Icons.people_outline,
              label: 'Студенты',
              value: '${group.currentStudents} из ${group.capacity}',
            ),
            const SizedBox(height: 8),
            _InfoRow(
              icon: Icons.calendar_month_outlined,
              label: 'Тип расписания',
              value: switch (group.scheduleType) {
                'EXACT_DAYS' => 'Конкретные дни',
                'ODD_DAYS' => 'Нечётные недели',
                'EVEN_DAYS' => 'Чётные недели',
                _ => group.scheduleType,
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  final ScheduleResponse schedule;

  const _ScheduleRow({required this.schedule});

  String get _dayLabel => switch (schedule.dayOfWeek) {
        'MONDAY' => 'Понедельник',
        'TUESDAY' => 'Вторник',
        'WEDNESDAY' => 'Среда',
        'THURSDAY' => 'Четверг',
        'FRIDAY' => 'Пятница',
        'SATURDAY' => 'Суббота',
        'SUNDAY' => 'Воскресенье',
        _ => schedule.dayOfWeek,
      };

  String _fmt(String t) {
    final p = t.split(':');
    return p.length >= 2 ? '${p[0]}:${p[1]}' : t;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 36,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _dayLabel,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              '${_fmt(schedule.startTime)} – ${_fmt(schedule.endTime)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final LessonSessionResponse session;
  final VoidCallback onTap;

  const _SessionCard({required this.session, required this.onTap});

  Color _statusColor(BuildContext context) => switch (session.status) {
        'PLANNED' => Theme.of(context).colorScheme.primary,
        'DONE' => Colors.green,
        'CANCELLED' => Colors.red,
        _ => Theme.of(context).colorScheme.onSurfaceVariant,
      };

  String get _statusLabel => switch (session.status) {
        'PLANNED' => 'Запланировано',
        'DONE' => 'Проведено',
        'CANCELLED' => 'Отменено',
        _ => session.status,
      };

  String _formatDt(String raw) {
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw;
    return DateFormat('d MMM, HH:mm', 'ru').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: session.status == 'PLANNED' ? onTap : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 50,
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session.lessonTitle,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${_formatDt(session.startTime)} – ${_formatDt(session.endTime).split(', ').last}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: statusColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      _statusLabel,
                      style: TextStyle(
                        fontSize: 10,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (session.status == 'PLANNED') ...[
                    const SizedBox(height: 4),
                    Text(
                      'Отметить',
                      style: TextStyle(
                        fontSize: 10,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
