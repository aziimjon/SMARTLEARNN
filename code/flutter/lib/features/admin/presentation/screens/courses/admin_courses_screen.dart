import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../courses/data/models/course_response.dart';
import '../../providers/admin_providers.dart';
import 'admin_course_form_screen.dart';
import 'admin_sections_screen.dart';

class AdminCoursesScreen extends ConsumerStatefulWidget {
  const AdminCoursesScreen({super.key});

  @override
  ConsumerState<AdminCoursesScreen> createState() => _AdminCoursesScreenState();
}

class _AdminCoursesScreenState extends ConsumerState<AdminCoursesScreen> {
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
      ref.read(adminCoursesNotifierProvider.notifier).loadMore();
    }
  }

  void _onSearchChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(adminCoursesNotifierProvider.notifier).search(v);
    });
  }

  Future<void> _openForm({CourseResponse? course}) async {
    final saved = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => AdminCourseFormScreen(course: course)),
    );
    if (saved == true) {
      ref.read(adminCoursesNotifierProvider.notifier).refresh();
    }
  }

  Future<void> _deleteCourse(CourseResponse course) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить курс?'),
        content: Text('«${course.title}» будет удалён.'),
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
    final result =
        await ref.read(adminCourseRepositoryProvider).deleteCourse(course.id);
    if (!mounted) return;
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => ref.read(adminCoursesNotifierProvider.notifier).refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adminCoursesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
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
          onRetry: () => ref.invalidate(adminCoursesNotifierProvider),
        ),
        data: (courses) {
          if (courses.isEmpty) {
            return const Center(child: Text('Курсов нет'));
          }
          return RefreshIndicator(
            onRefresh: () =>
                ref.read(adminCoursesNotifierProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: courses.length + 1,
              itemBuilder: (context, index) {
                if (index == courses.length) {
                  final hasNext =
                      ref.read(adminCoursesNotifierProvider.notifier).hasNext;
                  if (!hasNext) return const SizedBox.shrink();
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                final course = courses[index];
                return _CourseCard(
                  course: course,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AdminSectionsScreen(
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

class _CourseCard extends StatelessWidget {
  final CourseResponse course;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _CourseCard({
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

  @override
  Widget build(BuildContext context) {
    final levelColor = _levelColor(course.level);
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: levelColor.withAlpha(30),
          child: Icon(Icons.menu_book, color: levelColor, size: 20),
        ),
        title: Text(
          course.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${_levelLabel(course.level)} · ${course.durationInMinutes} min',
          style: const TextStyle(fontSize: 12),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
