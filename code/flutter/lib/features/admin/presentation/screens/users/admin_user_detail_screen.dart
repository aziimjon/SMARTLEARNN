import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user_preview.dart';
import 'admin_assign_student_screen.dart';
import 'admin_assign_teacher_screen.dart';
import 'admin_user_roles_screen.dart';

class AdminUserDetailScreen extends ConsumerWidget {
  final UserPreview user;

  const AdminUserDetailScreen({super.key, required this.user});

  Color _statusColor(String s) => switch (s) {
        'ACTIVE' => Colors.green,
        'INACTIVE' => Colors.orange,
        'BLOCKED' => Colors.red,
        _ => Colors.grey,
      };

  String _statusLabel(String s) => switch (s) {
        'ACTIVE' => 'Активен',
        'INACTIVE' => 'Неактивен',
        'BLOCKED' => 'Blocked',
        _ => s,
      };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusColor = _statusColor(user.status);

    return Scaffold(
      appBar: AppBar(title: const Text('Пользователь')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Info card ──────────────────────────────────────────────────────
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        child: Text(
                          user.firstName.isNotEmpty
                              ? user.firstName[0].toUpperCase()
                              : '?',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: statusColor.withAlpha(30),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                _statusLabel(user.status),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: statusColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  if (user.email != null)
                    _InfoRow(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: user.email!,
                    ),
                  if (user.phoneNumber != null)
                    _InfoRow(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: user.phoneNumber!,
                    ),
                  _InfoRow(
                    icon: Icons.badge_outlined,
                    label: 'Roles',
                    value: user.rolesLabel,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── Profile assignment section ─────────────────────────────────────
          Text(
            'Назначить профиль',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          const SizedBox(height: 12),

          FilledButton.icon(
            icon: const Icon(Icons.school_outlined),
            label: const Text('Назначить студента'),
            onPressed: () async {
              await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminAssignStudentScreen(
                    userId: user.id,
                    userName: user.fullName,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),

          FilledButton.icon(
            icon: const Icon(Icons.person_pin_outlined),
            label: const Text('Назначить преподавателя'),
            style: FilledButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.secondaryContainer,
              foregroundColor:
                  Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            onPressed: () async {
              await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminAssignTeacherScreen(
                    userId: user.id,
                    userName: user.fullName,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.shield_outlined),
            label: const Text('Управление ролями'),
            onPressed: () async {
              await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (_) => AdminUserRolesScreen(
                    userId: user.id,
                    userName: user.fullName,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ── Info row ──────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Theme.of(context).colorScheme.outline),
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
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
