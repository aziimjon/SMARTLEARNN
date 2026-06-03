import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/online_course_summary_response.dart';
import '../providers/online_course_providers.dart';
import 'online_course_detail_screen.dart';

class OnlineCoursesScreen extends ConsumerStatefulWidget {
  const OnlineCoursesScreen({super.key});

  @override
  ConsumerState<OnlineCoursesScreen> createState() =>
      _OnlineCoursesScreenState();
}

class _OnlineCoursesScreenState extends ConsumerState<OnlineCoursesScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(onlineCoursesNotifierProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onlineCoursesNotifierProvider);
    final notifier = ref.read(onlineCoursesNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Онлайн-курсы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: notifier.refresh,
          ),
        ],
      ),
      body: Column(
        children: [
          _SearchBar(
            controller: _searchController,
            onSearch: notifier.search,
          ),
          Expanded(
            child: state.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
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
              data: (courses) => courses.isEmpty
                  ? const Center(child: Text('Курсов не найдено'))
                  : ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 24),
                      itemCount: courses.length +
                          (notifier.isLoadingMore ? 1 : 0),
                      itemBuilder: (context, i) {
                        if (i == courses.length) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                                child: CircularProgressIndicator()),
                          );
                        }
                        return _CourseCard(
                          course: courses[i],
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => OnlineCourseDetailScreen(
                                courseId: courses[i].id,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }


}

class _SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Future<void> Function(String) onSearch;

  const _SearchBar({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: TextField(
        controller: controller,
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: 'Поиск курсов...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    onSearch('');
                  },
                )
              : null,
        ),
      ),
    );
  }
}

class _CourseCard extends StatelessWidget {
  final OnlineCourseSummaryResponse course;
  final VoidCallback onTap;

  const _CourseCard({required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            _Thumbnail(url: course.thumbnailUrl),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (course.shortDescription != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        course.shortDescription!,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _LevelChip(level: course.level),
                        const SizedBox(width: 8),
                        if (course.estimatedDurationInMinutes != null)
                          _DurationChip(
                              minutes: course.estimatedDurationInMinutes!),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final String? url;
  const _Thumbnail({required this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return Container(
        width: 100,
        height: 90,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Icon(
          Icons.play_circle_outline,
          color: Theme.of(context).colorScheme.primary,
          size: 36,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: url!,
      width: 100,
      height: 90,
      fit: BoxFit.cover,
      placeholder: (_, __) => Container(
        width: 100,
        height: 90,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (_, __, ___) => Container(
        width: 100,
        height: 90,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: const Icon(Icons.broken_image),
      ),
    );
  }
}

class _LevelChip extends StatelessWidget {
  final String level;
  const _LevelChip({required this.level});

  Color _color(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return switch (level) {
      'BEGINNER' => cs.primary,
      'INTERMEDIATE' => cs.secondary,
      'ADVANCED' => cs.error,
      _ => cs.outline,
    };
  }

  String _label() => switch (level) {
        'BEGINNER' => 'Начинающий',
        'INTERMEDIATE' => 'Средний',
        'ADVANCED' => 'Продвинутый',
        _ => level,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: _color(context).withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _label(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _color(context),
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final int minutes;
  const _DurationChip({required this.minutes});

  String get _label {
    if (minutes < 60) return '$minutes мин';
    final h = minutes ~/ 60;
    final m = minutes % 60;
    return m == 0 ? '$h ч' : '$h ч $m мин';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.access_time,
            size: 12, color: Theme.of(context).colorScheme.onSurfaceVariant),
        const SizedBox(width: 3),
        Text(
          _label,
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
