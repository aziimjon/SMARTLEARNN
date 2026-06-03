import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../auth/data/models/permission.dart';
import '../../providers/admin_providers.dart';
import 'admin_permission_form_screen.dart';

class AdminPermissionsScreen extends ConsumerStatefulWidget {
  const AdminPermissionsScreen({super.key});

  @override
  ConsumerState<AdminPermissionsScreen> createState() =>
      _AdminPermissionsScreenState();
}

class _AdminPermissionsScreenState
    extends ConsumerState<AdminPermissionsScreen> {
  final _scrollController = ScrollController();
  String? _selectedCategory;

  static const _categories = [
    null,
    'USER',
    'COURSE',
    'GROUP',
    'ADMIN',
    'REPORT',
  ];

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
      ref.read(adminPermissionsNotifierProvider.notifier).loadMore();
    }
  }

  Future<void> _openForm({Permission? permission}) async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => AdminPermissionFormScreen(permission: permission),
      ),
    );
    if (saved == true) {
      ref.read(adminPermissionsNotifierProvider.notifier).refresh();
    }
  }

  Future<void> _deletePermission(Permission permission) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить право?'),
        content:
            Text('Право «${permission.name}» будет удалено безвозвратно.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    final ok = await ref
        .read(adminPermissionsNotifierProvider.notifier)
        .deletePermission(permission.id);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Не удалось удалить право')),
      );
      return;
    }
    ref.read(adminPermissionsNotifierProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminPermissionsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Права доступа'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((cat) {
                  final selected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      label: Text(cat ?? 'All'),
                      selected: selected,
                      onSelected: (_) {
                        setState(() => _selectedCategory = cat);
                        ref
                            .read(adminPermissionsNotifierProvider.notifier)
                            .filterByCategory(cat);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(adminPermissionsNotifierProvider),
        ),
        data: (permissions) {
          if (permissions.isEmpty) {
            return const Center(child: Text('Права не найдены'));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(adminPermissionsNotifierProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: permissions.length + 1,
              itemBuilder: (context, index) {
                if (index == permissions.length) {
                  final hasNext = ref
                      .read(adminPermissionsNotifierProvider.notifier)
                      .hasNext;
                  if (!hasNext) return const SizedBox.shrink();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final p = permissions[index];
                return _PermissionCard(
                  permission: p,
                  onEdit: () => _openForm(permission: p),
                  onDelete: () => _deletePermission(p),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Добавить право'),
        onPressed: () => _openForm(),
      ),
    );
  }
}

// ── Permission Card ───────────────────────────────────────────────────────────

class _PermissionCard extends StatelessWidget {
  final Permission permission;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _PermissionCard({
    required this.permission,
    required this.onEdit,
    required this.onDelete,
  });

  Color _categoryColor(BuildContext context) => switch (permission.category) {
        'USER' => Colors.blue,
        'COURSE' => Colors.green,
        'GROUP' => Colors.orange,
        'ADMIN' => Colors.red,
        'REPORT' => Colors.purple,
        _ => Theme.of(context).colorScheme.primary,
      };

  @override
  Widget build(BuildContext context) {
    final color = _categoryColor(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withAlpha(30),
          child: Icon(Icons.key_outlined, color: color, size: 20),
        ),
        title: Text(
          permission.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: color.withAlpha(20),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            permission.category,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        isThreeLine: false,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
              tooltip: 'Edit',
            ),
            IconButton(
              icon: Icon(Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error),
              onPressed: onDelete,
              tooltip: 'Delete',
            ),
          ],
        ),
      ),
    );
  }
}
