import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../online_courses/data/models/online_course_summary_response.dart';
import '../../providers/admin_providers.dart';
import 'admin_online_course_form_screen.dart';
import 'admin_online_course_detail_screen.dart';

class AdminOnlineCoursesScreen extends ConsumerStatefulWidget {
  const AdminOnlineCoursesScreen({super.key});

  @override
  ConsumerState<AdminOnlineCoursesScreen> createState() =>
      _AdminOnlineCoursesScreenState();
}

class _AdminOnlineCoursesScreenState
    extends ConsumerState<AdminOnlineCoursesScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  Timer? _debounce;

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
      ref.read(adminOnlineCoursesNotifierProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref.read(adminOnlineCoursesNotifierProvider.notifier).search(v);
    });
  }

  Future<void> _openForm({OnlineCourseSummaryResponse? course}) async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => AdminOnlineCourseFormScreen(course: course),
      ),
    );
    if (saved == true) {
      ref.read(adminOnlineCoursesNotifierProvider.notifier).refresh();
    }
  }

  Future<void> _deleteCourse(OnlineCourseSummaryResponse course) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить онлайн-курс?'),
        content: Text(
            '«${course.title}» и все его модули/уроки будут удалены безвозвратно.'),
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

    final result = await ref
        .read(adminOnlineCourseRepositoryProvider)
        .deleteCourse(course.id);
    if (!mounted) return;

    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Курс удалён')),
        );
        ref.read(adminOnlineCoursesNotifierProvider.notifier).refresh();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminOnlineCoursesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Онлайн-курсы'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: TextField(
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
          ),
        ),
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(adminOnlineCoursesNotifierProvider),
        ),
        data: (courses) {
          if (courses.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_circle_outline,
                      size: 56,
                      color: Theme.of(context).colorScheme.outline),
                  const SizedBox(height: 12),
                  const Text('Онлайн-курсов нет'),
                ],
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref
                .read(adminOnlineCoursesNotifierProvider.notifier)
                .refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: courses.length + 1,
              itemBuilder: (context, index) {
                if (index == courses.length) {
                  final hasNext = ref
                      .read(adminOnlineCoursesNotifierProvider.notifier)
                      .hasNext;
                  if (!hasNext) return const SizedBox.shrink();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final course = courses[index];
                return _OnlineCourseCard(
                  course: course,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AdminOnlineCourseDetailScreen(
                        courseId: course.id,
                        courseTitle: course.title,
                      ),
                    ),
                  ),
                  onEdit: () => _openForm(course: course),
                  onDelete: () => _deleteCourse(course),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add course'),
        onPressed: () => _openForm(),
      ),
    );
  }
}

class _OnlineCourseCard extends StatelessWidget {
  final OnlineCourseSummaryResponse course;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _OnlineCourseCard({
    required this.course,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  Color _levelColor(String level) => switch (level) {
        'BEGINNER' => Colors.green,
        'INTERMEDIATE' => Colors.orange,
        'ADVANCED' => Colors.red,
        _ => Colors.grey,
      };

  String _levelLabel(String level) => switch (level) {
        'BEGINNER' => 'Beginner',
        'INTERMEDIATE' => 'Intermediate',
        'ADVANCED' => 'Advanced',
        _ => level,
      };

  String _statusLabel(String status) => switch (status) {
        'PUBLISHED' => 'Published',
        'DRAFT' => 'Draft',
        'ARCHIVED' => 'Архивирован',
        _ => status,
      };

  @override
  Widget build(BuildContext context) {
    final levelColor = _levelColor(course.level);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: levelColor.withValues(alpha: 0.15),
          child: Icon(Icons.play_circle_outline, color: levelColor, size: 22),
        ),
        title: Text(
          course.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          [
            _levelLabel(course.level),
            _statusLabel(course.status),
            if (course.estimatedDurationInMinutes != null)
              '${course.estimatedDurationInMinutes} мин',
          ].join(' · '),
          style: TextStyle(fontSize: 12, color: levelColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (v) {
            if (v == 'edit') onEdit();
            if (v == 'delete') onDelete();
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text('Edit')),
            PopupMenuItem(
              value: 'delete',
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
