import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../providers/attendance_providers.dart';

class MarkAttendanceScreen extends ConsumerStatefulWidget {
  final String sessionId;

  const MarkAttendanceScreen({super.key, required this.sessionId});

  @override
  ConsumerState<MarkAttendanceScreen> createState() =>
      _MarkAttendanceScreenState();
}

class _MarkAttendanceScreenState extends ConsumerState<MarkAttendanceScreen> {
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    final sessionAsync =
        ref.watch(sessionForAttendanceProvider(widget.sessionId));
    final existingAsync =
        ref.watch(sessionAttendancesProvider(widget.sessionId));

    return Scaffold(
      appBar: AppBar(title: const Text('Отметить посещаемость')),
      body: sessionAsync.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(message: e.toString()),
        data: (session) => existingAsync.when(
          loading: () => const LoadingWidget(),
          error: (e, _) => AppErrorWidget(message: e.toString()),
          data: (existing) {
            if (!_initialized) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref
                    .read(markAttendanceProvider(widget.sessionId).notifier)
                    .initFromExisting(existing);
                setState(() => _initialized = true);
              });
            }

            final rosterAsync = ref
                .watch(groupStudentRosterProvider(session.groupId));

            return rosterAsync.when(
              loading: () => const LoadingWidget(),
              error: (e, _) => _NoRosterBody(
                sessionId: widget.sessionId,
                existing: existing,
                sessionTitle: session.lessonTitle,
                sessionTime:
                    '${_fmt(session.startTime)} – ${_fmt(session.endTime).split(', ').last}',
              ),
              data: (roster) {
                // Merge roster with existing (existing students not in history)
                final merged = _mergeRoster(roster, existing);
                return _AttendanceBody(
                  sessionId: widget.sessionId,
                  sessionTitle: session.lessonTitle,
                  sessionTime:
                      '${_fmt(session.startTime)} – ${_fmt(session.endTime).split(', ').last}',
                  roster: merged,
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<StudentEntry> _mergeRoster(
      List<StudentEntry> roster, List<dynamic> existing) {
    final seen = {for (final s in roster) s.studentId};
    final merged = List<StudentEntry>.from(roster);
    for (final a in existing) {
      if (!seen.contains(a.studentId)) {
        merged.add(StudentEntry(
          studentId: a.studentId,
          fullName: a.studentFullName ?? a.studentId,
        ));
      }
    }
    return merged..sort((a, b) => a.fullName.compareTo(b.fullName));
  }

  String _fmt(String raw) {
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw;
    return DateFormat('d MMM, HH:mm', 'ru').format(dt);
  }
}

// ─── Body with roster ─────────────────────────────────────────────────────────

class _AttendanceBody extends ConsumerWidget {
  final String sessionId;
  final String sessionTitle;
  final String sessionTime;
  final List<StudentEntry> roster;

  const _AttendanceBody({
    required this.sessionId,
    required this.sessionTitle,
    required this.sessionTime,
    required this.roster,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final markState = ref.watch(markAttendanceProvider(sessionId));
    final notifier = ref.read(markAttendanceProvider(sessionId).notifier);

    // Show success message
    ref.listen(markAttendanceProvider(sessionId), (prev, next) {
      if (next.saved && !(prev?.saved ?? false)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Посещаемость сохранена'),
            backgroundColor: Colors.green,
          ),
        );
      }
      if (next.error != null && prev?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Column(
      children: [
        // Session header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sessionTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                sessionTime,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 8),
              // Quick-fill buttons
              Row(
                children: [
                  _QuickFillButton(
                    label: 'Все присутствуют',
                    color: Colors.green,
                    onTap: () {
                      for (final s in roster) {
                        notifier.setMark(s.studentId, 'PRESENT');
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  _QuickFillButton(
                    label: 'Все отсутствуют',
                    color: Colors.red,
                    onTap: () {
                      for (final s in roster) {
                        notifier.setMark(s.studentId, 'ABSENT');
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        if (roster.isEmpty)
          const Expanded(
            child: Center(child: Text('Нет студентов в группе')),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: roster.length,
              itemBuilder: (context, index) {
                final student = roster[index];
                final currentStatus = markState.marks[student.studentId];
                return _StudentRow(
                  student: student,
                  currentStatus: currentStatus,
                  onStatusChanged: (s) =>
                      notifier.setMark(student.studentId, s),
                );
              },
            ),
          ),

        // Save button
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: markState.isSaving || markState.marks.isEmpty
                  ? null
                  : () => notifier.save(),
              child: markState.isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Сохранить'),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── No roster fallback ───────────────────────────────────────────────────────

class _NoRosterBody extends StatelessWidget {
  final String sessionId;
  final List<dynamic> existing;
  final String sessionTitle;
  final String sessionTime;

  const _NoRosterBody({
    required this.sessionId,
    required this.existing,
    required this.sessionTitle,
    required this.sessionTime,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Нет данных о студентах',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'История посещаемости пуста. Отметьте студентов через поиск или они появятся автоматически.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Student row with status selector ────────────────────────────────────────

class _StudentRow extends StatelessWidget {
  final StudentEntry student;
  final String? currentStatus;
  final ValueChanged<String> onStatusChanged;

  const _StudentRow({
    required this.student,
    required this.currentStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor:
                Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              student.fullName.isNotEmpty
                  ? student.fullName[0].toUpperCase()
                  : '?',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              student.fullName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          _StatusChips(
            current: currentStatus,
            onSelected: onStatusChanged,
          ),
        ],
      ),
    );
  }
}

class _StatusChips extends StatelessWidget {
  final String? current;
  final ValueChanged<String> onSelected;

  const _StatusChips({required this.current, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    const statuses = [
      ('P', 'PRESENT', Colors.green),
      ('L', 'LATE', Colors.orange),
      ('A', 'ABSENT', Colors.red),
      ('E', 'EXCUSED', Colors.blue),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: statuses.map((s) {
        final (label, status, color) = s;
        final selected = current == status;
        return Padding(
          padding: const EdgeInsets.only(left: 4),
          child: GestureDetector(
            onTap: () => onSelected(status),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: selected ? color : color.withAlpha(30),
                borderRadius: BorderRadius.circular(6),
              ),
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : color,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _QuickFillButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickFillButton({
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: color.withAlpha(30),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: color.withAlpha(80)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
