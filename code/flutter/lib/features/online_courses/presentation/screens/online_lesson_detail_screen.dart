import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/online_course_providers.dart';

class OnlineLessonDetailScreen extends ConsumerStatefulWidget {
  final String lessonId;
  final String lessonTitle;
  final String courseId;

  const OnlineLessonDetailScreen({
    super.key,
    required this.lessonId,
    required this.lessonTitle,
    required this.courseId,
  });

  @override
  ConsumerState<OnlineLessonDetailScreen> createState() =>
      _OnlineLessonDetailScreenState();
}

class _OnlineLessonDetailScreenState
    extends ConsumerState<OnlineLessonDetailScreen> {
  bool _markingComplete = false;

  Future<void> _markCompleted() async {
    setState(() => _markingComplete = true);
    final result = await ref
        .read(onlineCourseRepositoryProvider)
        .updateLessonProgress(
          widget.lessonId,
          status: 'COMPLETED',
        );
    if (!mounted) return;
    setState(() => _markingComplete = false);
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Урок отмечен как завершённый'),
            backgroundColor: Colors.green,
          ),
        );
        ref.invalidate(myEnrollmentsNotifierProvider);
        ref.invalidate(
            onlineCourseDetailProvider(widget.courseId));
      },
    );
  }

  Future<void> _markStarted() async {
    await ref
        .read(onlineCourseRepositoryProvider)
        .updateLessonProgress(
          widget.lessonId,
          status: 'IN_PROGRESS',
        );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _markStarted());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lessonTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final courseState =
              ref.watch(onlineCourseDetailProvider(widget.courseId));
          return courseState.when(
            loading: () =>
                const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text(e.toString())),
            data: (course) {
              final lesson = course.modules
                  .expand((m) => m.lessons)
                  .where((l) => l.id == widget.lessonId)
                  .firstOrNull;

              if (lesson == null) {
                return const Center(child: Text('Урок не найден'));
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Video placeholder
                    if (lesson.videoUrl != null) ...[
                      _VideoPlaceholder(videoUrl: lesson.videoUrl!),
                      const SizedBox(height: 16),
                    ],

                    // Lesson meta
                    Row(
                      children: [
                        if (lesson.durationInMinutes != null)
                          _MetaChip(
                            icon: Icons.access_time,
                            label: '${lesson.durationInMinutes} мин',
                          ),
                        const SizedBox(width: 8),
                        if (lesson.freePreview)
                          _MetaChip(
                            icon: Icons.visibility,
                            label: 'Бесплатный просмотр',
                            color: theme.colorScheme.primary,
                          ),
                      ],
                    ),

                    // Description
                    if (lesson.description != null &&
                        lesson.description!.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        lesson.description!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],

                    // Content
                    if (lesson.content != null &&
                        lesson.content!.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(
                        lesson.content!,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],

                    // Materials
                    if (lesson.materials.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(
                        'Материалы',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      ...lesson.materials.map(
                        (m) => ListTile(
                          leading:
                              const Icon(Icons.attach_file),
                          title: Text(m.title ?? 'Материал'),
                          onTap: () {
                            // TODO: open attachment URL
                          },
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // Mark complete button
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed:
                            _markingComplete ? null : _markCompleted,
                        icon: _markingComplete
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.check_circle_outline),
                        label: Text(_markingComplete
                            ? 'Сохраняю...'
                            : 'Отметить урок выполненным'),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _VideoPlaceholder extends StatelessWidget {
  final String videoUrl;
  const _VideoPlaceholder({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.play_circle_fill,
                size: 56, color: Colors.white70),
            const SizedBox(height: 8),
            Text(
              'Видеоурок',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const _MetaChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? Theme.of(context).colorScheme.onSurfaceVariant;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: c),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: c),
        ),
      ],
    );
  }
}
