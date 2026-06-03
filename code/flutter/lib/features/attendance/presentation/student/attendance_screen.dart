import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../data/models/attendance_response.dart';
import '../providers/attendance_providers.dart';

class AttendanceScreen extends ConsumerStatefulWidget {
  const AttendanceScreen({super.key});

  @override
  ConsumerState<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends ConsumerState<AttendanceScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 200) {
      ref.read(attendanceHistoryNotifierProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(attendanceHistoryNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Посещаемость')),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(attendanceHistoryNotifierProvider),
        ),
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('Данных о посещаемости нет'));
          }
          return RefreshIndicator(
            onRefresh: () => ref
                .read(attendanceHistoryNotifierProvider.notifier)
                .refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: records.length + 1,
              itemBuilder: (context, index) {
                if (index == records.length) {
                  final hasNext = ref
                      .read(attendanceHistoryNotifierProvider.notifier)
                      .hasNext;
                  if (!hasNext) return const SizedBox.shrink();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return _AttendanceCard(record: records[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class _AttendanceCard extends StatelessWidget {
  final AttendanceResponse record;

  const _AttendanceCard({required this.record});

  Color _statusColor(BuildContext context) => switch (record.status) {
        'PRESENT' => Colors.green,
        'LATE' => Colors.orange,
        'ABSENT' => Colors.red,
        'EXCUSED' => Colors.blue,
        _ => Theme.of(context).colorScheme.onSurfaceVariant,
      };

  String get _statusLabel => switch (record.status) {
        'PRESENT' => 'Присутствовал',
        'LATE' => 'Опоздал',
        'ABSENT' => 'Отсутствовал',
        'EXCUSED' => 'Уважительная',
        _ => record.status,
      };

  IconData get _statusIcon => switch (record.status) {
        'PRESENT' => Icons.check_circle_outline,
        'LATE' => Icons.schedule_outlined,
        'ABSENT' => Icons.cancel_outlined,
        'EXCUSED' => Icons.info_outline,
        _ => Icons.help_outline,
      };

  String _formatDateTime(String raw) {
    final dt = DateTime.tryParse(raw);
    if (dt == null) return raw;
    return DateFormat('d MMM, HH:mm', 'ru').format(dt);
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(_statusIcon, color: statusColor, size: 28),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.lessonTitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    record.groupName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    _formatDateTime(record.lessonStartTime),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
