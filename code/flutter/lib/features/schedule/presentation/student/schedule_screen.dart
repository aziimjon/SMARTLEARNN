import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../../attendance/data/models/attendance_response.dart';
import '../../../attendance/presentation/providers/attendance_providers.dart';

class ScheduleScreen extends ConsumerStatefulWidget {
  const ScheduleScreen({super.key});

  @override
  ConsumerState<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends ConsumerState<ScheduleScreen> {
  late DateTime _weekStart;

  @override
  void initState() {
    super.initState();
    _weekStart = _currentWeekMonday();
  }

  DateTime _currentWeekMonday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day - (now.weekday - 1));
  }

  void _prevWeek() => setState(() {
        _weekStart = _weekStart.subtract(const Duration(days: 7));
      });

  void _nextWeek() => setState(() {
        _weekStart = _weekStart.add(const Duration(days: 7));
      });

  bool get _isCurrentWeek {
    final current = _currentWeekMonday();
    return _weekStart.year == current.year &&
        _weekStart.month == current.month &&
        _weekStart.day == current.day;
  }

  @override
  Widget build(BuildContext context) {
    final weekEnd = _weekStart.add(const Duration(days: 7));
    final weekLabel =
        '${DateFormat('d MMM', 'en').format(_weekStart)} — ${DateFormat('d MMM', 'en').format(weekEnd.subtract(const Duration(days: 1)))}';
    final state = ref.watch(weeklyAttendanceProvider(_weekStart));

    return Scaffold(
      appBar: AppBar(title: const Text('Schedule')),
      body: Column(
        children: [
          // Навигация по неделям
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: _prevWeek,
                ),
                Column(
                  children: [
                    Text(
                      weekLabel,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (_isCurrentWeek)
                      Text(
                        'Current Week',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: _nextWeek,
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: state.when(
              loading: () => const LoadingWidget(),
              error: (e, _) => AppErrorWidget(
                message: e.toString(),
                onRetry: () =>
                    ref.invalidate(weeklyAttendanceProvider(_weekStart)),
              ),
              data: (records) {
                if (records.isEmpty) {
                  return const Center(
                    child: Text('No classes this week'),
                  );
                }
                final grouped = _groupByDay(records);
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: grouped.length,
                  itemBuilder: (context, index) {
                    final day = grouped.keys.elementAt(index);
                    final sessions = grouped[day]!;
                    return _DaySection(day: day, sessions: sessions);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Map<DateTime, List<AttendanceResponse>> _groupByDay(
      List<AttendanceResponse> records) {
    final map = <DateTime, List<AttendanceResponse>>{};
    for (final r in records) {
      final dt = DateTime.tryParse(r.lessonStartTime);
      if (dt == null) continue;
      final day = DateTime(dt.year, dt.month, dt.day);
      map.putIfAbsent(day, () => []).add(r);
    }
    // Сортируем дни
    final sorted = Map.fromEntries(
      map.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
    // Сортируем сессии внутри дня по времени начала
    for (final key in sorted.keys) {
      sorted[key]!.sort((a, b) {
        final ta = DateTime.tryParse(a.lessonStartTime);
        final tb = DateTime.tryParse(b.lessonStartTime);
        if (ta == null || tb == null) return 0;
        return ta.compareTo(tb);
      });
    }
    return sorted;
  }
}

class _DaySection extends StatelessWidget {
  final DateTime day;
  final List<AttendanceResponse> sessions;

  const _DaySection({required this.day, required this.sessions});

  @override
  Widget build(BuildContext context) {
    final isToday = _isToday(day);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, top: 4),
          child: Row(
            children: [
              Text(
                DateFormat('EEEE, d MMMM', 'en').format(day),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isToday
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
              ),
              if (isToday) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 11,
                      color:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        ...sessions.map((s) => _SessionCard(session: s)),
        const SizedBox(height: 12),
      ],
    );
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}

class _SessionCard extends StatelessWidget {
  final AttendanceResponse session;

  const _SessionCard({required this.session});

  Color _statusColor(BuildContext context) => switch (session.status) {
        'PRESENT' => Colors.green,
        'LATE' => Colors.orange,
        'ABSENT' => Colors.red,
        'EXCUSED' => Colors.blue,
        _ => Theme.of(context).colorScheme.onSurfaceVariant,
      };

  String get _statusLabel => switch (session.status) {
        'PRESENT' => 'Present',
        'LATE' => 'Late',
        'ABSENT' => 'Absent',
        'EXCUSED' => 'Excused',
        _ => session.status,
      };

  String _formatTime(String raw) {
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw;
    return DateFormat('HH:mm').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            // Время
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _formatTime(session.lessonStartTime),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  _formatTime(session.lessonEndTime),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Разделитель
            Container(
              width: 3,
              height: 44,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            // Название и группа
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.lessonTitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    session.groupName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            // Статус
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: statusColor.withAlpha(30),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _statusLabel,
                style: TextStyle(
                  fontSize: 11,
                  color: statusColor,
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
