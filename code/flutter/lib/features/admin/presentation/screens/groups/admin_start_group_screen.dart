import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/admin_providers.dart';

class AdminStartGroupScreen extends ConsumerStatefulWidget {
  final String groupId;
  final String groupName;

  const AdminStartGroupScreen({
    super.key,
    required this.groupId,
    required this.groupName,
  });

  @override
  ConsumerState<AdminStartGroupScreen> createState() =>
      _AdminStartGroupScreenState();
}

class _AdminStartGroupScreenState
    extends ConsumerState<AdminStartGroupScreen> {
  final List<_ScheduleEntry> _entries = [_ScheduleEntry()];
  bool _loading = false;

  static const _days = [
    'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY',
    'FRIDAY', 'SATURDAY', 'SUNDAY',
  ];
  static const _dayLabels = {
    'MONDAY': 'Понедельник', 'TUESDAY': 'Вторник', 'WEDNESDAY': 'Среда',
    'THURSDAY': 'Четверг', 'FRIDAY': 'Пятница',
    'SATURDAY': 'Суббота', 'SUNDAY': 'Воскресенье',
  };

  String _fmt(TimeOfDay t) =>
      '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  Future<void> _pickTime(
    _ScheduleEntry entry,
    bool isStart,
  ) async {
    final initial = isStart ? entry.startTime : entry.endTime;
    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (ctx, child) => MediaQuery(
        data: MediaQuery.of(ctx).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      ),
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        entry.startTime = picked;
      } else {
        entry.endTime = picked;
      }
    });
  }

  Future<void> _submit() async {
    if (_entries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Добавьте хотя бы одно расписание')),
      );
      return;
    }
    setState(() => _loading = true);

    final schedules = _entries
        .map((e) => {
              'dayOfWeek': e.dayOfWeek,
              'startTime': _fmt(e.startTime),
              'endTime': _fmt(e.endTime),
            })
        .toList();

    final result = await ref
        .read(adminGroupRepositoryProvider)
        .startGroup(widget.groupId, schedules: schedules);

    if (!mounted) return;
    setState(() => _loading = false);

    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => Navigator.pop(context, true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Запуск: ${widget.groupName}')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _entries.length,
              itemBuilder: (ctx, i) {
                final entry = _entries[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Занятие ${i + 1}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            if (_entries.length > 1)
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline,
                                    color: Colors.red),
                                onPressed: () =>
                                    setState(() => _entries.removeAt(i)),
                              ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: entry.dayOfWeek,
                          decoration: const InputDecoration(
                            labelText: 'День недели',
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                          items: _days
                              .map((d) => DropdownMenuItem(
                                    value: d,
                                    child: Text(_dayLabels[d]!),
                                  ))
                              .toList(),
                          onChanged: (v) =>
                              setState(() => entry.dayOfWeek = v!),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: _TimeButton(
                                label: 'Начало',
                                time: entry.startTime,
                                onTap: () => _pickTime(entry, true),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: _TimeButton(
                                label: 'Конец',
                                time: entry.endTime,
                                onTap: () => _pickTime(entry, false),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Добавить день'),
                  onPressed: () =>
                      setState(() => _entries.add(_ScheduleEntry())),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: _loading ? null : _submit,
                  child: _loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Запустить группу'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Time button ───────────────────────────────────────────────────────────────

class _TimeButton extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;

  const _TimeButton({
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
          suffixIcon: const Icon(Icons.access_time, size: 18),
        ),
        child: Text(time.format(context)),
      ),
    );
  }
}

// ── Schedule entry model ──────────────────────────────────────────────────────

class _ScheduleEntry {
  String dayOfWeek = 'MONDAY';
  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 10, minute: 30);
}
