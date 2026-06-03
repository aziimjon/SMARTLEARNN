import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../groups/data/models/group_response.dart';
import '../../providers/admin_providers.dart';
import 'admin_generate_sessions_screen.dart';
import 'admin_group_form_screen.dart';
import 'admin_start_group_screen.dart';

class AdminGroupDetailScreen extends ConsumerWidget {
  final String groupId;

  const AdminGroupDetailScreen({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminGroupDetailProvider(groupId));

    return Scaffold(
      appBar: AppBar(title: const Text('Группа')),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(adminGroupDetailProvider(groupId)),
        ),
        data: (group) => _GroupDetailBody(
          group: group,
          onRefresh: () => ref.invalidate(adminGroupDetailProvider(groupId)),
        ),
      ),
    );
  }
}

// ── Body ──────────────────────────────────────────────────────────────────────

class _GroupDetailBody extends ConsumerWidget {
  final GroupResponse group;
  final VoidCallback onRefresh;

  const _GroupDetailBody({required this.group, required this.onRefresh});

  Color _statusColor(String s) => switch (s) {
        'FORMING' => Colors.blue,
        'ACTIVE' => Colors.green,
        'FINISHED' => Colors.grey,
        'CANCELLED' => Colors.red,
        _ => Colors.grey,
      };

  String _statusLabel(String s) => switch (s) {
        'FORMING' => 'Recruiting',
        'ACTIVE' => 'Active',
        'FINISHED' => 'Completed',
        'CANCELLED' => 'Отменена',
        _ => s,
      };

  String _scheduleTypeLabel(String t) => switch (t) {
        'EXACT_DAYS' => 'Конкретные дни',
        'ODD_DAYS' => 'Нечётные дни',
        'EVEN_DAYS' => 'Чётные дни',
        _ => t,
      };

  String _dayLabel(String d) => switch (d) {
        'MONDAY' => 'Пн',
        'TUESDAY' => 'Вт',
        'WEDNESDAY' => 'Ср',
        'THURSDAY' => 'Чт',
        'FRIDAY' => 'Пт',
        'SATURDAY' => 'Сб',
        'SUNDAY' => 'Вс',
        _ => d,
      };

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить группу?'),
        content: Text('«${group.name}» будет удалена.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    final result =
        await ref.read(adminGroupRepositoryProvider).deleteGroup(group.id);
    if (!context.mounted) return;
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusColor = _statusColor(group.status);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── Info card ──────────────────────────────────────────────────────────
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        group.name,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _statusLabel(group.status),
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _Row(
                  icon: Icons.menu_book_outlined,
                  label: 'Курс',
                  value: group.courseName,
                ),
                _Row(
                  icon: Icons.person_outline,
                  label: 'Teacher',
                  value:
                      '${group.teacher.firstName} ${group.teacher.lastName}',
                ),
                _Row(
                  icon: Icons.people_outline,
                  label: 'Студентов',
                  value: '${group.currentStudents} / ${group.capacity}',
                ),
                _Row(
                  icon: Icons.calendar_today_outlined,
                  label: 'Schedule',
                  value: _scheduleTypeLabel(group.scheduleType),
                ),
                if (group.scheduleDays.isNotEmpty)
                  _Row(
                    icon: Icons.today_outlined,
                    label: 'Дни',
                    value: group.scheduleDays.map(_dayLabel).join(', '),
                  ),
                _Row(
                  icon: group.active
                      ? Icons.check_circle_outline
                      : Icons.cancel_outlined,
                  label: 'Active',
                  value: group.active ? 'Да' : 'Нет',
                  valueColor: group.active ? Colors.green : Colors.red,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // ── Actions ────────────────────────────────────────────────────────────
        FilledButton.icon(
          icon: const Icon(Icons.edit_outlined),
          label: const Text('Edit'),
          onPressed: () async {
            final saved = await Navigator.push<bool>(
              context,
              MaterialPageRoute(
                builder: (_) => AdminGroupFormScreen(group: group),
              ),
            );
            if (saved == true) onRefresh();
          },
        ),

        if (group.status == 'FORMING') ...[
          const SizedBox(height: 8),
          FilledButton.icon(
            icon: const Icon(Icons.play_arrow_outlined),
            label: const Text('Запустить группу'),
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () async {
              final started = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminStartGroupScreen(
                    groupId: group.id,
                    groupName: group.name,
                  ),
                ),
              );
              if (started == true) onRefresh();
            },
          ),
        ],

        if (group.status == 'ACTIVE') ...[
          const SizedBox(height: 8),
          FilledButton.icon(
            icon: const Icon(Icons.event_outlined),
            label: const Text('Генерировать сессии'),
            style: FilledButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () async {
              final generated = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminGenerateSessionsScreen(
                    groupId: group.id,
                    groupName: group.name,
                  ),
                ),
              );
              if (generated == true && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Сессии успешно созданы')),
                );
              }
            },
          ),
        ],

        const SizedBox(height: 8),
        OutlinedButton.icon(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          label: const Text(
            'Удалить группу',
            style: TextStyle(color: Colors.red),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
          ),
          onPressed: () => _delete(context, ref),
        ),
      ],
    );
  }
}

// ── Info row ──────────────────────────────────────────────────────────────────

class _Row extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  const _Row({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon,
              size: 16, color: Theme.of(context).colorScheme.outline),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontSize: 13,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
