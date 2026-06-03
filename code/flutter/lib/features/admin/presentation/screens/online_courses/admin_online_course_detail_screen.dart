import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../shared/widgets/app_error_widget.dart';
import '../../../../../shared/widgets/loading_widget.dart';
import '../../../../online_courses/data/models/online_course_lesson_response.dart';
import '../../../../online_courses/data/models/online_course_module_response.dart';
import '../../providers/admin_providers.dart';

class AdminOnlineCourseDetailScreen extends ConsumerWidget {
  final String courseId;
  final String courseTitle;

  const AdminOnlineCourseDetailScreen({
    super.key,
    required this.courseId,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(adminOnlineCourseDetailProvider(courseId));

    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle, overflow: TextOverflow.ellipsis),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () =>
                ref.invalidate(adminOnlineCourseDetailProvider(courseId)),
          ),
        ],
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (e, _) => AppErrorWidget(
          message: e.toString(),
          onRetry: () =>
              ref.invalidate(adminOnlineCourseDetailProvider(courseId)),
        ),
        data: (course) => course.modules.isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.view_module_outlined,
                      size: 56,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 12),
                    const Text('Модулей нет — добавьте первый'),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 100),
                itemCount: course.modules.length,
                itemBuilder: (ctx, i) => _ModuleCard(
                  module: course.modules[i],
                  courseId: courseId,
                  onChanged: () =>
                      ref.invalidate(adminOnlineCourseDetailProvider(courseId)),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Добавить модуль'),
        onPressed: () async {
          final saved = await _showModuleForm(context, ref, courseId: courseId);
          if (saved == true) {
            ref.invalidate(adminOnlineCourseDetailProvider(courseId));
          }
        },
      ),
    );
  }
}

// ── Module card with inline lesson list ──────────────────────────────────────

class _ModuleCard extends ConsumerWidget {
  final OnlineCourseModuleResponse module;
  final String courseId;
  final VoidCallback onChanged;

  const _ModuleCard({
    required this.module,
    required this.courseId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          // Module header
          ListTile(
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primaryContainer,
              child: Text(
                '${module.orderIndex + 1}',
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
            subtitle: Text(
              '${module.lessons.length} уроков · ${_statusLabel(module.status)}',
              style: const TextStyle(fontSize: 12),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  tooltip: 'Редактировать модуль',
                  onPressed: () async {
                    final saved = await _showModuleForm(
                      context,
                      ref,
                      courseId: courseId,
                      module: module,
                    );
                    if (saved == true) onChanged();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  tooltip: 'Удалить модуль',
                  onPressed: () => _deleteModule(context, ref),
                ),
              ],
            ),
          ),

          // Lesson list
          if (module.lessons.isNotEmpty) ...[
            const Divider(height: 1),
            ...module.lessons.map(
              (lesson) => _LessonTile(
                lesson: lesson,
                moduleId: module.id,
                onChanged: onChanged,
              ),
            ),
          ],

          // Add lesson button
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Добавить урок'),
              onPressed: () async {
                final saved = await _showLessonForm(
                  context,
                  ref,
                  moduleId: module.id,
                );
                if (saved == true) onChanged();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteModule(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Удалить модуль?'),
        content:
            Text('«${module.title}» и все его уроки будут удалены.'),
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

    final result = await ref
        .read(adminOnlineCourseRepositoryProvider)
        .deleteModule(module.id);
    if (!context.mounted) return;

    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => onChanged(),
    );
  }

  String _statusLabel(String s) => switch (s) {
        'PUBLISHED' => 'Published',
        'DRAFT' => 'Draft',
        'HIDDEN' => 'Скрыт',
        _ => s,
      };
}

// ── Lesson tile ───────────────────────────────────────────────────────────────

class _LessonTile extends ConsumerWidget {
  final OnlineCourseLessonResponse lesson;
  final String moduleId;
  final VoidCallback onChanged;

  const _LessonTile({
    required this.lesson,
    required this.moduleId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(
        lesson.videoUrl != null
            ? Icons.play_circle_outline
            : Icons.article_outlined,
        color: theme.colorScheme.secondary,
        size: 20,
      ),
      title: Text(lesson.title, style: const TextStyle(fontSize: 14)),
      subtitle: Row(
        children: [
          if (lesson.durationInMinutes != null)
            Text(
              '${lesson.durationInMinutes} мин',
              style: const TextStyle(fontSize: 12),
            ),
          if (lesson.freePreview) ...[
            const Text(' · ', style: TextStyle(fontSize: 12)),
            Text(
              'Бесплатно',
              style: TextStyle(
                  fontSize: 12, color: theme.colorScheme.primary),
            ),
          ],
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, size: 18),
            tooltip: 'Редактировать урок',
            onPressed: () async {
              final saved = await _showLessonForm(
                context,
                ref,
                moduleId: moduleId,
                lesson: lesson,
              );
              if (saved == true) onChanged();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline,
                color: Colors.red, size: 18),
            tooltip: 'Удалить урок',
            onPressed: () => _deleteLesson(context, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteLesson(BuildContext context, WidgetRef ref) async {
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

    final result = await ref
        .read(adminOnlineCourseRepositoryProvider)
        .deleteLesson(lesson.id);
    if (!context.mounted) return;

    result.fold(
      (f) => ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(f.message))),
      (_) => onChanged(),
    );
  }
}

// ── Module form (bottom sheet) ────────────────────────────────────────────────

Future<bool?> _showModuleForm(
  BuildContext context,
  WidgetRef ref, {
  required String courseId,
  OnlineCourseModuleResponse? module,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _ModuleFormSheet(
      courseId: courseId,
      module: module,
    ),
  );
}

class _ModuleFormSheet extends ConsumerStatefulWidget {
  final String courseId;
  final OnlineCourseModuleResponse? module;

  const _ModuleFormSheet({required this.courseId, this.module});

  @override
  ConsumerState<_ModuleFormSheet> createState() => _ModuleFormSheetState();
}

class _ModuleFormSheetState extends ConsumerState<_ModuleFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final _titleCtrl =
      TextEditingController(text: widget.module?.title ?? '');
  late final _descCtrl =
      TextEditingController(text: widget.module?.description ?? '');
  late final _orderCtrl = TextEditingController(
    text: widget.module != null ? '${widget.module!.orderIndex}' : '',
  );
  late String _status = widget.module?.status ?? 'DRAFT';
  bool _loading = false;

  static const _statuses = ['DRAFT', 'PUBLISHED', 'HIDDEN'];
  static const _statusLabels = {
    'DRAFT': 'Draft',
    'PUBLISHED': 'Published',
    'HIDDEN': 'Скрыт',
  };

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _orderCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final repo = ref.read(adminOnlineCourseRepositoryProvider);
    final title = _titleCtrl.text.trim();
    final desc =
        _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim();
    final order = int.parse(_orderCtrl.text.trim());

    final result = widget.module == null
        ? await repo.addModule(
            widget.courseId,
            title: title,
            description: desc,
            orderIndex: order,
            status: _status,
          )
        : await repo.updateModule(
            widget.module!.id,
            title: title,
            description: desc,
            orderIndex: order,
            status: _status,
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
    final isEdit = widget.module != null;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16, 16, 16,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isEdit ? 'Редактировать модуль' : 'Новый модуль',
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
              controller: _descCtrl,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _orderCtrl,
                    decoration: const InputDecoration(
                      labelText: 'Порядок *',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'Обязательное';
                      }
                      final n = int.tryParse(v.trim());
                      if (n == null || n < 0) return '≥ 0';
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _status,
                    decoration: const InputDecoration(
                      labelText: 'Статус',
                      border: OutlineInputBorder(),
                    ),
                    items: _statuses
                        .map((s) => DropdownMenuItem(
                              value: s,
                              child: Text(_statusLabels[s]!),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : Text(isEdit ? 'Save' : 'Создать модуль'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Lesson form (bottom sheet) ────────────────────────────────────────────────

Future<bool?> _showLessonForm(
  BuildContext context,
  WidgetRef ref, {
  required String moduleId,
  OnlineCourseLessonResponse? lesson,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    builder: (_) => _LessonFormSheet(moduleId: moduleId, lesson: lesson),
  );
}

class _LessonFormSheet extends ConsumerStatefulWidget {
  final String moduleId;
  final OnlineCourseLessonResponse? lesson;

  const _LessonFormSheet({required this.moduleId, this.lesson});

  @override
  ConsumerState<_LessonFormSheet> createState() => _LessonFormSheetState();
}

class _LessonFormSheetState extends ConsumerState<_LessonFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final _titleCtrl =
      TextEditingController(text: widget.lesson?.title ?? '');
  late final _descCtrl =
      TextEditingController(text: widget.lesson?.description ?? '');
  late final _orderCtrl = TextEditingController(
    text: widget.lesson != null ? '${widget.lesson!.orderIndex}' : '',
  );
  late final _durationCtrl = TextEditingController(
    text: widget.lesson?.durationInMinutes != null
        ? '${widget.lesson!.durationInMinutes}'
        : '',
  );
  late String _status = widget.lesson?.status ?? 'DRAFT';
  late bool _freePreview = widget.lesson?.freePreview ?? false;
  bool _loading = false;

  static const _statuses = ['DRAFT', 'PUBLISHED', 'HIDDEN'];
  static const _statusLabels = {
    'DRAFT': 'Draft',
    'PUBLISHED': 'Published',
    'HIDDEN': 'Скрыт',
  };

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _orderCtrl.dispose();
    _durationCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final repo = ref.read(adminOnlineCourseRepositoryProvider);
    final title = _titleCtrl.text.trim();
    final desc =
        _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim();
    final order = int.parse(_orderCtrl.text.trim());
    final duration = _durationCtrl.text.trim().isEmpty
        ? null
        : int.tryParse(_durationCtrl.text.trim());

    final result = widget.lesson == null
        ? await repo.addLesson(
            widget.moduleId,
            title: title,
            description: desc,
            orderIndex: order,
            durationInMinutes: duration,
            freePreview: _freePreview,
            status: _status,
          )
        : await repo.updateLesson(
            widget.lesson!.id,
            title: title,
            description: desc,
            orderIndex: order,
            durationInMinutes: duration,
            freePreview: _freePreview,
            status: _status,
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
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16, 16, 16,
        MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Обязательное поле'
                    : null,
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _descCtrl,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _orderCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Порядок *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) {
                          return 'Обязательное';
                        }
                        final n = int.tryParse(v.trim());
                        if (n == null || n < 0) return '≥ 0';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _durationCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Длительность (мин)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return null;
                        final n = int.tryParse(v.trim());
                        if (n == null || n <= 0) return '> 0';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: _status,
                decoration: const InputDecoration(
                  labelText: 'Статус',
                  border: OutlineInputBorder(),
                ),
                items: _statuses
                    .map((s) => DropdownMenuItem(
                          value: s,
                          child: Text(_statusLabels[s]!),
                        ))
                    .toList(),
                onChanged: (v) => setState(() => _status = v!),
              ),
              const SizedBox(height: 8),

              SwitchListTile(
                value: _freePreview,
                title: const Text('Бесплатный просмотр'),
                subtitle: const Text(
                    'Незарегистрированные пользователи могут видеть урок'),
                onChanged: (v) => setState(() => _freePreview = v),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 16),

              FilledButton(
                onPressed: _loading ? null : _submit,
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : Text(isEdit ? 'Save' : 'Создать урок'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
