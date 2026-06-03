import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../groups/data/models/group_response.dart';
import '../../providers/admin_providers.dart';
import 'admin_group_detail_screen.dart';
import 'admin_group_form_screen.dart';

class AdminGroupsScreen extends ConsumerStatefulWidget {
  const AdminGroupsScreen({super.key});

  @override
  ConsumerState<AdminGroupsScreen> createState() => _AdminGroupsScreenState();
}

class _AdminGroupsScreenState extends ConsumerState<AdminGroupsScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;
  String? _selectedStatus;

  static const _statuses = [null, 'FORMING', 'ACTIVE', 'FINISHED', 'CANCELLED'];
  static const _statusLabels = {
    'FORMING': 'Recruiting',
    'ACTIVE': 'Active',
    'FINISHED': 'Completed',
    'CANCELLED': 'Отменена',
  };

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
      ref.read(adminGroupsNotifierProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(adminGroupsNotifierProvider.notifier).search(v);
    });
  }

  Future<void> _openCreate() async {
    final created = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const AdminGroupFormScreen()),
    );
    if (created == true) {
      ref.read(adminGroupsNotifierProvider.notifier).refresh();
    }
  }

  Future<void> _deleteGroup(GroupResponse group) async {
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
    if (confirmed != true || !mounted) return;
    final result =
        await ref.read(adminGroupRepositoryProvider).deleteGroup(group.id);
    if (!mounted) return;
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => ref.read(adminGroupsNotifierProvider.notifier).refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminGroupsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(108),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    hintText: 'Search by name...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _statuses.map((status) {
                      final selected = _selectedStatus == status;
                      return Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: FilterChip(
                          label: Text(
                            status == null ? 'All' : _statusLabels[status]!,
                          ),
                          selected: selected,
                          onSelected: (_) {
                            setState(() => _selectedStatus = status);
                            ref
                                .read(adminGroupsNotifierProvider.notifier)
                                .filterByStatus(status);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(adminGroupsNotifierProvider),
        ),
        data: (groups) {
          if (groups.isEmpty) {
            return const Center(child: Text('Групп нет'));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(adminGroupsNotifierProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: groups.length + 1,
              itemBuilder: (context, index) {
                if (index == groups.length) {
                  final hasNext =
                      ref.read(adminGroupsNotifierProvider.notifier).hasNext;
                  if (!hasNext) return const SizedBox.shrink();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final group = groups[index];
                return _GroupCard(
                  group: group,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            AdminGroupDetailScreen(groupId: group.id),
                      ),
                    );
                    ref.read(adminGroupsNotifierProvider.notifier).refresh();
                  },
                  onDelete: () => _deleteGroup(group),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add group'),
        onPressed: _openCreate,
      ),
    );
  }
}

// ── Group card ────────────────────────────────────────────────────────────────

class _GroupCard extends StatelessWidget {
  final GroupResponse group;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _GroupCard({
    required this.group,
    required this.onTap,
    required this.onDelete,
  });

  Color _statusColor(String status) => switch (status) {
        'FORMING' => Colors.blue,
        'ACTIVE' => Colors.green,
        'FINISHED' => Colors.grey,
        'CANCELLED' => Colors.red,
        _ => Colors.grey,
      };

  String _statusLabel(String status) => switch (status) {
        'FORMING' => 'Recruiting',
        'ACTIVE' => 'Active',
        'FINISHED' => 'Completed',
        'CANCELLED' => 'Отменена',
        _ => status,
      };

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(group.status);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: statusColor.withAlpha(30),
          child: Icon(Icons.groups, color: statusColor, size: 20),
        ),
        title: Text(
          group.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(group.courseName, style: const TextStyle(fontSize: 12)),
            Text(
              '${group.teacher.firstName} ${group.teacher.lastName}'
              ' · ${group.currentStudents}/${group.capacity}',
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: statusColor.withAlpha(30),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _statusLabel(group.status),
                style: TextStyle(
                  fontSize: 11,
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
