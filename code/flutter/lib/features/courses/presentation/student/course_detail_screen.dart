import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/routes.dart';
import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/loading_widget.dart';
import '../../data/models/course_response.dart';
import '../../data/models/course_section_response.dart';
import '../../data/models/lesson_response.dart';
import '../providers/course_providers.dart';

class CourseDetailScreen extends ConsumerWidget {
  final String courseId;

  const CourseDetailScreen({super.key, required this.courseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(courseDetailProvider(courseId));

    return state.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const LoadingWidget(),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(courseDetailProvider(courseId)),
        ),
      ),
      data: (course) => _CourseDetailContent(
        course: course,
        courseId: courseId,
      ),
    );
  }
}

class _CourseDetailContent extends StatelessWidget {
  final CourseResponse course;
  final String courseId;

  const _CourseDetailContent({
    required this.course,
    required this.courseId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _CourseInfoCard(course: course),
          const SizedBox(height: 20),
          if (course.sections.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Text('Разделы ещё не добавлены'),
              ),
            )
          else ...[
            Text(
              'Содержание курса',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ...(List<CourseSectionResponse>.from(course.sections)
                  ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex)))
                .map(
                  (section) => _SectionTile(
                    section: section,
                    courseId: courseId,
                  ),
                ),
          ],
        ],
      ),
    );
  }
}

class _CourseInfoCard extends StatelessWidget {
  final CourseResponse course;

  const _CourseInfoCard({required this.course});

  Color _levelColor(BuildContext context) => switch (course.level) {
        'BEGINNER' => Colors.green,
        'INTERMEDIATE' => Colors.orange,
        'ADVANCED' => Colors.red,
        _ => Theme.of(context).colorScheme.primary,
      };

  String get _levelLabel => switch (course.level) {
        'BEGINNER' => 'Начальный',
        'INTERMEDIATE' => 'Средний',
        'ADVANCED' => 'Продвинутый',
        _ => course.level,
      };

  String get _duration {
    final m = course.durationInMinutes;
    if (m < 60) return '$m мин';
    final h = m ~/ 60;
    final rem = m % 60;
    return rem > 0 ? '$h ч $rem мин' : '$h ч';
  }

  @override
  Widget build(BuildContext context) {
    final levelColor = _levelColor(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (course.description != null &&
                course.description!.isNotEmpty) ...[
              Text(
                course.description!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 16),
            ],
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: levelColor.withAlpha(38),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _levelLabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: levelColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.access_time,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  _duration,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.list_alt_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '${course.sections.length} разд.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  final CourseSectionResponse section;
  final String courseId;

  const _SectionTile({required this.section, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        childrenPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 16,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            '${section.orderIndex + 1}',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        title: Text(
          section.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Text(
          '${section.lessons.length} ${_lessonWord(section.lessons.length)}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        children: section.lessons.isEmpty
            ? [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Уроки ещё не добавлены'),
                ),
              ]
            : section.lessons
                .map(
                  (lesson) => _LessonTile(
                    lesson: lesson,
                    courseId: courseId,
                  ),
                )
                .toList(),
      ),
    );
  }

  String _lessonWord(int count) {
    if (count % 10 == 1 && count % 100 != 11) return 'урок';
    if (count % 10 >= 2 &&
        count % 10 <= 4 &&
        (count % 100 < 10 || count % 100 >= 20)) {
      return 'урока';
    }
    return 'уроков';
  }
}

class _LessonTile extends StatelessWidget {
  final LessonResponse lesson;
  final String courseId;

  const _LessonTile({required this.lesson, required this.courseId});

  String get _duration {
    final m = lesson.durationInMinutes;
    if (m < 60) return '$m мин';
    final h = m ~/ 60;
    final rem = m % 60;
    return rem > 0 ? '$h ч $rem мин' : '$h ч';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(
        Routes.studentLesson(courseId, lesson.id),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.play_circle_outline,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                lesson.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _duration,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
