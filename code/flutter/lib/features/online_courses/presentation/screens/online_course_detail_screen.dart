import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/online_course_module_response.dart';
import '../../data/models/online_course_response.dart';
import '../providers/online_course_providers.dart';
import 'online_lesson_detail_screen.dart';

class OnlineCourseDetailScreen extends ConsumerWidget {
  final String courseId;

  const OnlineCourseDetailScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onlineCourseDetailProvider(courseId));

    return Scaffold(
      body: state.when(
        loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        error: (e, _) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(e.toString()),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () =>
                      ref.invalidate(onlineCourseDetailProvider(courseId)),
                  child: const Text('Повторить'),
                ),
              ],
            ),
          ),
        ),
        data: (course) => _CourseBody(course: course),
      ),
    );
  }
}

class _CourseBody extends ConsumerWidget {
  final OnlineCourseResponse course;
  const _CourseBody({required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        _CourseAppBar(course: course),
        SliverToBoxAdapter(child: _CourseInfo(course: course)),
        SliverToBoxAdapter(
          child: _EnrollButton(courseId: course.id, ref: ref),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              'Содержание курса',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        if (course.modules.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Модули пока не добавлены'),
            ),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) => _ModuleTile(
                module: course.modules[i],
                moduleIndex: i,
                courseId: course.id,
              ),
              childCount: course.modules.length,
            ),
          ),
        const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
      ],
    );
  }
}

class _CourseAppBar extends StatelessWidget {
  final OnlineCourseResponse course;
  const _CourseAppBar({required this.course});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          course.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        background: course.thumbnailUrl != null
            ? CachedNetworkImage(
                imageUrl: course.thumbnailUrl!,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => _DefaultBg(),
              )
            : _DefaultBg(),
      ),
    );
  }
}

class _DefaultBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Center(
        child: Icon(
          Icons.play_circle_fill,
          size: 64,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _CourseInfo extends StatelessWidget {
  final OnlineCourseResponse course;
  const _CourseInfo({required this.course});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _Badge(label: _levelLabel(course.level), color: _levelColor(context, course.level)),
              const SizedBox(width: 8),
              _Badge(label: _strategyLabel(course.unlockStrategy), color: theme.colorScheme.secondary),
              const Spacer(),
              if (course.estimatedDurationInMinutes != null)
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 14),
                    const SizedBox(width: 4),
                    Text(_durationLabel(course.estimatedDurationInMinutes!),
                        style: theme.textTheme.bodySmall),
                  ],
                ),
            ],
          ),
          if (course.description != null && course.description!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              course.description!,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
          if (course.createdByName != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.person_outline, size: 14),
                const SizedBox(width: 4),
                Text(course.createdByName!, style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Color _levelColor(BuildContext context, String level) {
    final cs = Theme.of(context).colorScheme;
    return switch (level) {
      'BEGINNER' => cs.primary,
      'INTERMEDIATE' => cs.secondary,
      'ADVANCED' => cs.error,
      _ => cs.outline,
    };
  }

  String _levelLabel(String level) => switch (level) {
        'BEGINNER' => 'Начинающий',
        'INTERMEDIATE' => 'Средний',
        'ADVANCED' => 'Продвинутый',
        _ => level,
      };

  String _strategyLabel(String s) => switch (s) {
        'SEQUENTIAL' => 'Последовательно',
        'FREE' => 'Свободный доступ',
        _ => s,
      };

  String _durationLabel(int minutes) {
    if (minutes < 60) return '$minutes мин';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m == 0 ? '$h ч' : '$h ч $m мин';
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color),
      ),
    );
  }
}

class _EnrollButton extends ConsumerStatefulWidget {
  final String courseId;
  final WidgetRef ref;
  const _EnrollButton({required this.courseId, required this.ref});

  @override
  ConsumerState<_EnrollButton> createState() => _EnrollButtonState();
}

class _EnrollButtonState extends ConsumerState<_EnrollButton> {
  bool _loading = false;

  Future<void> _enroll() async {
    setState(() => _loading = true);
    final result = await ref
        .read(onlineCourseRepositoryProvider)
        .enrollMe(widget.courseId);
    if (!mounted) return;
    setState(() => _loading = false);
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Вы записаны на курс!')),
        );
        ref.invalidate(myEnrollmentsNotifierProvider);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton.icon(
          onPressed: _loading ? null : _enroll,
          icon: _loading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.white),
                )
              : const Icon(Icons.school),
          label: Text(_loading ? 'Записываюсь...' : 'Записаться на курс'),
        ),
      ),
    );
  }
}

class _ModuleTile extends StatelessWidget {
  final OnlineCourseModuleResponse module;
  final int moduleIndex;
  final String courseId;

  const _ModuleTile({
    required this.module,
    required this.moduleIndex,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Text(
            '${moduleIndex + 1}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
        title: Text(
          module.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: module.lessons.isNotEmpty
            ? Text('${module.lessons.length} уроков',
                style: theme.textTheme.bodySmall)
            : null,
        children: module.lessons.isEmpty
            ? [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Уроки пока не добавлены'),
                )
              ]
            : module.lessons.map((lesson) {
                return ListTile(
                  leading: Icon(
                    lesson.videoUrl != null
                        ? Icons.play_circle_outline
                        : Icons.article_outlined,
                    color: theme.colorScheme.primary,
                  ),
                  title: Text(lesson.title),
                  subtitle: lesson.durationInMinutes != null
                      ? Text('${lesson.durationInMinutes} мин',
                          style: theme.textTheme.bodySmall)
                      : null,
                  trailing: lesson.freePreview
                      ? Chip(
                          label: const Text('Бесплатно'),
                          labelStyle: TextStyle(
                              fontSize: 11, color: theme.colorScheme.primary),
                          backgroundColor:
                              theme.colorScheme.primaryContainer,
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                        )
                      : const Icon(Icons.lock_outline, size: 18),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => OnlineLessonDetailScreen(
                        lessonId: lesson.id,
                        lessonTitle: lesson.title,
                        courseId: courseId,
                      ),
                    ),
                  ),
                );
              }).toList(),
      ),
    );
  }
}
