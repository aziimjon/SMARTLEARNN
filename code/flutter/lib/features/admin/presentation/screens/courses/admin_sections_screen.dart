import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../courses/data/models/course_section_response.dart';
import '../../providers/admin_providers.dart';
import 'admin_lessons_screen.dart';

class AdminSectionsScreen extends ConsumerWidget {
  final String courseId;
  final String courseTitle;

  const AdminSectionsScreen({
    super.key,
    required this.courseId,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminCourseSectionsProvider(courseId));

    return Scaffold(
      appBar: AppBar(title: Text('Разделы: $courseTitle')),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(adminCourseSectionsProvider(courseId)),
        ),
        data: (sections) {
          if (sections.isEmpty) {
            return const Center(child: Text('Разделов нет'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: sections.length,
            itemBuilder: (ctx, index) {
              final section = sections[index];
              return _SectionCard(
                section: section,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdminLessonsScreen(
                      sectionId: section.id,
                      sectionTitle: section.title,
                    ),
                  ),
                ),
                onEdit: () => _showForm(context, ref, section: section),
                onDelete: () => _delete(context, ref, section),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Добавить раздел'),
        onPressed: () => _showForm(context, ref),
      ),
    );
  }

  Future<void> _showForm(
    BuildContext context,
    WidgetRef ref, {
    CourseSectionResponse? section,
  }) async {
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _SectionFormSheet(
        courseId: courseId,
        section: section,
      ),
    );
    if (saved == true) {
      ref.invalidate(adminCourseSectionsProvider(courseId));
    }
  }

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    CourseSectionResponse section,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить раздел?'),
        content: Text('«${section.title}» и все его уроки будут удалены.'),
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
    if (confirmed != true || !context.mounted) return;
    final result =
        await ref.read(adminCourseRepositoryProvider).deleteSection(section.id);
    if (!context.mounted) return;
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => ref.invalidate(adminCourseSectionsProvider(courseId)),
    );
  }
}

// ── Bottom sheet form ─────────────────────────────────────────────────────────

class _SectionFormSheet extends ConsumerStatefulWidget {
  final String courseId;
  final CourseSectionResponse? section;

  const _SectionFormSheet({required this.courseId, this.section});

  @override
  ConsumerState<_SectionFormSheet> createState() => _SectionFormSheetState();
}

class _SectionFormSheetState extends ConsumerState<_SectionFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final _titleCtrl =
      TextEditingController(text: widget.section?.title ?? '');
  late final _orderCtrl = TextEditingController(
    text: widget.section != null ? '${widget.section!.orderIndex}' : '',
  );
  bool _loading = false;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _orderCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final repo = ref.read(adminCourseRepositoryProvider);
    final title = _titleCtrl.text.trim();
    final order = int.parse(_orderCtrl.text.trim());

    final result = widget.section == null
        ? await repo.createSection(
            title: title,
            courseId: widget.courseId,
            orderIndex: order,
          )
        : await repo.updateSection(
            widget.section!.id,
            title: title,
            orderIndex: order,
          );

    if (!mounted) return;
    setState(() => _loading = false);

    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => Navigator.pop(context, true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.section != null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isEdit ? 'Редактировать раздел' : 'Новый раздел',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleCtrl,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Название *',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Обязательное поле' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _orderCtrl,
              decoration: const InputDecoration(
                labelText: 'Порядок (0, 1, 2...) *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Обязательное поле';
                final n = int.tryParse(v.trim());
                if (n == null || n < 0) return 'Введите число ≥ 0';
                return null;
              },
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(isEdit ? 'Save' : 'Создать'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section card ──────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final CourseSectionResponse section;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _SectionCard({
    required this.section,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: Text(
            '${section.orderIndex + 1}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          section.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${section.lessons.length} уроков',
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
