import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../auth/data/models/role.dart';
import '../../providers/admin_providers.dart';

class AdminUserRolesScreen extends ConsumerStatefulWidget {
  final String userId;
  final String userName;

  const AdminUserRolesScreen({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  ConsumerState<AdminUserRolesScreen> createState() =>
      _AdminUserRolesScreenState();
}

class _AdminUserRolesScreenState extends ConsumerState<AdminUserRolesScreen> {
  Set<String> _selectedIds = {};
  bool _initialized = false;
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    final userRolesState =
        ref.watch(adminUserRolesNotifierProvider(widget.userId));
    final allRolesState = ref.watch(adminRolesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Роли: ${widget.userName}'),
        actions: [
          if (_saving)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            TextButton(
              onPressed: _save,
              child: const Text('Save'),
            ),
        ],
      ),
      body: userRolesState.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(
              adminUserRolesNotifierProvider(widget.userId)),
        ),
        data: (userRoles) {
          if (!_initialized) {
            _selectedIds = userRoles.map((r) => r.id).toSet();
            _initialized = true;
          }

          return allRolesState.when(
            loading: () => const LoadingWidget(),
            error: (e, _) => AppErrorWidget(
              message: e.toString(),
              onRetry: () => ref.invalidate(adminRolesNotifierProvider),
            ),
            data: (allRoles) {
              if (allRoles.isEmpty) {
                return const Center(child: Text('Роли не найдены'));
              }
              return _buildRoleList(allRoles, userRoles);
            },
          );
        },
      ),
    );
  }

  Widget _buildRoleList(List<Role> allRoles, List<Role> userRoles) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Отметьте нужные роли и нажмите «Сохранить»',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: allRoles.length,
            itemBuilder: (context, index) {
              final role = allRoles[index];
              final selected = _selectedIds.contains(role.id);
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: CheckboxListTile(
                  value: selected,
                  onChanged: (v) {
                    setState(() {
                      if (v == true) {
                        _selectedIds.add(role.id);
                      } else {
                        _selectedIds.remove(role.id);
                      }
                    });
                  },
                  title: Text(
                    role.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: role.permissions.isNotEmpty
                      ? Text(
                          '${role.permissions.length} прав',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        )
                      : null,
                  secondary: CircleAvatar(
                    backgroundColor: selected
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.shield_outlined,
                      size: 18,
                      color: selected
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _save() async {
    setState(() => _saving = true);

    final ok = await ref
        .read(adminUserRolesNotifierProvider(widget.userId).notifier)
        .setRoles(widget.userId, _selectedIds.toList());

    if (!mounted) return;
    setState(() => _saving = false);

    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Роли успешно обновлены')),
      );
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Ошибка сохранения ролей'),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }
}
