import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../courses/data/models/lesson_response.dart';
import '../../providers/admin_providers.dart';

class AdminLessonsScreen extends ConsumerWidget {
  final String sectionId;
  final String sectionTitle;

  const AdminLessonsScreen({
    super.key,
    required this.sectionId,
    required this.sectionTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminSectionLessonsProvider(sectionId));

    return Scaffold(
      appBar: AppBar(title: Text('Уроки: $sectionTitle')),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () => ref.invalidate(adminSectionLessonsProvider(sectionId)),
        ),
        data: (lessons) {
          if (lessons.isEmpty) {
            return const Center(child: Text('Уроков нет'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: lessons.length,
            itemBuilder: (ctx, index) {
              final lesson = lessons[index];
              return _LessonCard(
                lesson: lesson,
                onEdit: () => _showForm(context, ref, lesson: lesson),
                onDelete: () => _delete(context, ref, lesson),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Добавить урок'),
        onPressed: () => _showForm(context, ref),
      ),
    );
  }

  Future<void> _showForm(
    BuildContext context,
    WidgetRef ref, {
    LessonResponse? lesson,
  }) async {
    final saved = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _LessonFormSheet(
        sectionId: sectionId,
        lesson: lesson,
      ),
    );
    if (saved == true) {
      ref.invalidate(adminSectionLessonsProvider(sectionId));
    }
  }

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    LessonResponse lesson,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить урок?'),
        content: Text('«${lesson.title}» будет удалён.'),
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
        await ref.read(adminCourseRepositoryProvider).deleteLesson(lesson.id);
    if (!context.mounted) return;
    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => ref.invalidate(adminSectionLessonsProvider(sectionId)),
    );
  }
}

// ── Bottom sheet form ─────────────────────────────────────────────────────────

class _LessonFormSheet extends ConsumerStatefulWidget {
  final String sectionId;
  final LessonResponse? lesson;

  const _LessonFormSheet({required this.sectionId, this.lesson});

  @override
  ConsumerState<_LessonFormSheet> createState() => _LessonFormSheetState();
}

class _LessonFormSheetState extends ConsumerState<_LessonFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final _titleCtrl =
      TextEditingController(text: widget.lesson?.title ?? '');
  late final _contentCtrl =
      TextEditingController(text: widget.lesson?.content ?? '');
  late final _durationCtrl = TextEditingController(
    text: widget.lesson != null ? '${widget.lesson!.durationInMinutes}' : '',
  );
  bool _loading = false;

  @override
  void dispose() {
    _titleCtrl.dispose();
    _contentCtrl.dispose();
    _durationCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final repo = ref.read(adminCourseRepositoryProvider);
    final title = _titleCtrl.text.trim();
    final content =
        _contentCtrl.text.trim().isEmpty ? null : _contentCtrl.text.trim();
    final duration = int.parse(_durationCtrl.text.trim());

    final result = widget.lesson == null
        ? await repo.createLesson(
            title: title,
            content: content,
            durationInMinutes: duration,
            sectionId: widget.sectionId,
          )
        : await repo.updateLesson(
            widget.lesson!.id,
            title: title,
            content: content,
            durationInMinutes: duration,
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
    final isEdit = widget.lesson != null;
    return SingleChildScrollView(
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
              isEdit ? 'Редактировать урок' : 'Новый урок',
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
              controller: _contentCtrl,
              decoration: const InputDecoration(
                labelText: 'Контент',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _durationCtrl,
              decoration: const InputDecoration(
                labelText: 'Длительность (минуты) *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Обязательное поле';
                final n = int.tryParse(v.trim());
                if (n == null || n <= 0) return 'Введите положительное число';
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

// ── Lesson card ───────────────────────────────────────────────────────────────

class _LessonCard extends StatelessWidget {
  final LessonResponse lesson;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _LessonCard({
    required this.lesson,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          child: Icon(
            Icons.play_lesson_outlined,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            size: 20,
          ),
        ),
        title: Text(
          lesson.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${lesson.durationInMinutes} мин'
          '${lesson.content != null ? ' · есть контент' : ''}',
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
