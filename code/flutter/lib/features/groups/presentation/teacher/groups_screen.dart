import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/routes.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../data/models/group_response.dart';
import '../providers/group_providers.dart';

class GroupsScreen extends ConsumerStatefulWidget {
  const GroupsScreen({super.key});

  @override
  ConsumerState<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends ConsumerState<GroupsScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final pos = _scrollController.position;
    if (pos.pixels >= pos.maxScrollExtent - 200) {
      ref.read(teacherGroupsNotifierProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(teacherGroupsNotifierProvider.notifier).search(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(teacherGroupsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои группы'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Поиск по названию...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ),
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(teacherGroupsNotifierProvider),
        ),
        data: (groups) {
          if (groups.isEmpty) {
            return const Center(child: Text('Нет групп'));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(teacherGroupsNotifierProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: groups.length + 1,
              itemBuilder: (context, index) {
                if (index == groups.length) {
                  final hasNext = ref
                      .read(teacherGroupsNotifierProvider.notifier)
                      .hasNext;
                  if (!hasNext) return const SizedBox.shrink();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return _GroupCard(
                  group: groups[index],
                  onTap: () =>
                      context.push(Routes.teacherGroupDetail(groups[index].id)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  final GroupResponse group;
  final VoidCallback onTap;

  const _GroupCard({required this.group, required this.onTap});

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
      margin: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      group.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
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
                        fontSize: 11,
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                group.courseName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.people_outline, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    '${group.currentStudents} / ${group.capacity}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  const Icon(Icons.calendar_today_outlined, size: 15),
                  const SizedBox(width: 4),
                  Text(
                    _scheduleDaysLabel(group.scheduleDays),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _scheduleDaysLabel(List<String> days) {
    const ru = {
      'MONDAY': 'Пн',
      'TUESDAY': 'Вт',
      'WEDNESDAY': 'Ср',
      'THURSDAY': 'Чт',
      'FRIDAY': 'Пт',
      'SATURDAY': 'Сб',
      'SUNDAY': 'Вс',
    };
    if (days.isEmpty) return '—';
    return days.map((d) => ru[d] ?? d).join(', ');
  }
}
