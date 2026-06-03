import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../../core/router/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    final user = auth.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartLearn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: () => ref.read(authNotifierProvider).logout(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Добро пожаловать,',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              user?.fullName ?? '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              user?.roles.map((r) => r.name).join(', ') ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 32),
            if (user?.isStudent == true) ...[
              FilledButton.icon(
                icon: const Icon(Icons.menu_book_outlined),
                label: const Text('Мои курсы'),
                onPressed: () => context.push(Routes.studentCourses),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                icon: const Icon(Icons.calendar_today_outlined),
                label: const Text('Расписание'),
                onPressed: () => context.push(Routes.studentSchedule),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                icon: const Icon(Icons.fact_check_outlined),
                label: const Text('Посещаемость'),
                onPressed: () => context.push(Routes.studentAttendance),
              ),
            ],
            if (user?.isTeacher == true) ...[
              FilledButton.icon(
                icon: const Icon(Icons.groups_outlined),
                label: const Text('Мои группы'),
                onPressed: () => context.push(Routes.teacherGroups),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
