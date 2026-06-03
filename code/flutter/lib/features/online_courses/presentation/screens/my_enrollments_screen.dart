import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/online_course_enrollment_response.dart';
import '../providers/online_course_providers.dart';
import 'online_course_detail_screen.dart';

class MyEnrollmentsScreen extends ConsumerStatefulWidget {
  const MyEnrollmentsScreen({super.key});

  @override
  ConsumerState<MyEnrollmentsScreen> createState() =>
      _MyEnrollmentsScreenState();
}

class _MyEnrollmentsScreenState extends ConsumerState<MyEnrollmentsScreen> {
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
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(myEnrollmentsNotifierProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myEnrollmentsNotifierProvider);
    final notifier = ref.read(myEnrollmentsNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои курсы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: notifier.refresh,
          ),
        ],
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(e.toString()),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: notifier.refresh,
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
        data: (enrollments) => enrollments.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.school_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    const Text('Вы пока не записаны ни на один курс'),
                    const SizedBox(height: 8),
                    const Text(
                      'Перейдите в каталог курсов чтобы записаться',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 24),
                itemCount: enrollments.length +
                    (notifier.isLoadingMore ? 1 : 0),
                itemBuilder: (context, i) {
                  if (i == enrollments.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child:
                          Center(child: CircularProgressIndicator()),
                    );
                  }
                  return _EnrollmentCard(
                    enrollment: enrollments[i],
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => OnlineCourseDetailScreen(
                          courseId: enrollments[i].course.id,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class _EnrollmentCard extends StatelessWidget {
  final OnlineCourseEnrollmentResponse enrollment;
  final VoidCallback onTap;

  const _EnrollmentCard({required this.enrollment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = enrollment.progressPercentage / 100;
    final course = enrollment.course;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      course.title,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _StatusChip(status: enrollment.status),
                ],
              ),
              if (course.shortDescription != null) ...[
                const SizedBox(height: 4),
                Text(
                  course.shortDescription!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        minHeight: 8,
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _progressColor(context, progress),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${enrollment.completedLessons}/${enrollment.totalLessons}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '${enrollment.progressPercentage.toStringAsFixed(0)}% завершено',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _progressColor(BuildContext context, double progress) {
    final cs = Theme.of(context).colorScheme;
    if (progress >= 1.0) return Colors.green;
    if (progress >= 0.5) return cs.primary;
    return cs.secondary;
  }
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  String get _label => switch (status) {
        'ACTIVE' => 'Активен',
        'COMPLETED' => 'Завершён',
        'CANCELLED' => 'Отменён',
        'SUSPENDED' => 'Приостановлен',
        _ => status,
      };

  Color _color(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return switch (status) {
      'ACTIVE' => cs.primary,
      'COMPLETED' => Colors.green,
      'CANCELLED' => cs.error,
      'SUSPENDED' => cs.secondary,
      _ => cs.outline,
    };
  }

  @override
  Widget build(BuildContext context) {
    final color = _color(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        _label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
