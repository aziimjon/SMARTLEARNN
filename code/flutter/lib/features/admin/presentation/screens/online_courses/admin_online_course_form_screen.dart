import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../online_courses/data/models/online_course_summary_response.dart';
import '../../providers/admin_providers.dart';

class AdminOnlineCourseFormScreen extends ConsumerStatefulWidget {
  final OnlineCourseSummaryResponse? course;

  const AdminOnlineCourseFormScreen({super.key, this.course});

  @override
  ConsumerState<AdminOnlineCourseFormScreen> createState() =>
      _AdminOnlineCourseFormScreenState();
}

class _AdminOnlineCourseFormScreenState
    extends ConsumerState<AdminOnlineCourseFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final _titleCtrl =
      TextEditingController(text: widget.course?.title ?? '');
  late final _slugCtrl =
      TextEditingController(text: widget.course?.slug ?? '');
  late final _shortDescCtrl =
      TextEditingController(text: widget.course?.shortDescription ?? '');
  late final _durationCtrl = TextEditingController(
    text: widget.course?.estimatedDurationInMinutes != null
        ? '${widget.course!.estimatedDurationInMinutes}'
        : '',
  );

  late String _level = widget.course?.level ?? 'BEGINNER';
  late String _status = widget.course?.status ?? 'DRAFT';
  late String _unlockStrategy =
      widget.course?.unlockStrategy ?? 'SEQUENTIAL';

  bool _loading = false;

  static const _levels = ['BEGINNER', 'INTERMEDIATE', 'ADVANCED'];
  static const _levelLabels = {
    'BEGINNER': 'Beginner',
    'INTERMEDIATE': 'Intermediate',
    'ADVANCED': 'Advanced',
  };

  static const _statuses = ['DRAFT', 'PUBLISHED', 'ARCHIVED'];
  static const _statusLabels = {
    'DRAFT': 'Draft',
    'PUBLISHED': 'Published',
    'ARCHIVED': 'Архивирован',
  };

  static const _strategies = ['SEQUENTIAL', 'FREE'];
  static const _strategyLabels = {
    'SEQUENTIAL': 'Последовательно',
    'FREE': 'Свободный доступ',
  };

  @override
  void dispose() {
    _titleCtrl.dispose();
    _slugCtrl.dispose();
    _shortDescCtrl.dispose();
    _durationCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final repo = ref.read(adminOnlineCourseRepositoryProvider);
    final title = _titleCtrl.text.trim();
    final slug = _slugCtrl.text.trim().isEmpty ? null : _slugCtrl.text.trim();
    final shortDesc = _shortDescCtrl.text.trim().isEmpty
        ? null
        : _shortDescCtrl.text.trim();
    final duration = _durationCtrl.text.trim().isEmpty
        ? null
        : int.tryParse(_durationCtrl.text.trim());

    final result = widget.course == null
        ? await repo.createCourse(
            title: title,
            slug: slug,
            shortDescription: shortDesc,
            level: _level,
            status: _status,
            unlockStrategy: _unlockStrategy,
            estimatedDurationInMinutes: duration,
          )
        : await repo.updateCourse(
            widget.course!.id,
            title: title,
            slug: slug,
            shortDescription: shortDesc,
            level: _level,
            status: _status,
            unlockStrategy: _unlockStrategy,
            estimatedDurationInMinutes: duration,
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
    final isEdit = widget.course != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Редактировать курс' : 'Новый онлайн-курс'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleCtrl,
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
              controller: _slugCtrl,
              decoration: const InputDecoration(
                labelText: 'Slug (URL-идентификатор)',
                hintText: 'например: flutter-for-beginners',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _shortDescCtrl,
              decoration: const InputDecoration(
                labelText: 'Краткое описание',
                border: OutlineInputBorder(),
                helperText: 'Максимум 500 символов',
              ),
              maxLines: 2,
              maxLength: 500,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _level,
              decoration: const InputDecoration(
                labelText: 'Уровень *',
                border: OutlineInputBorder(),
              ),
              items: _levels
                  .map((l) => DropdownMenuItem(
                        value: l,
                        child: Text(_levelLabels[l]!),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _level = v!),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _status,
              decoration: const InputDecoration(
                labelText: 'Статус *',
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
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _unlockStrategy,
              decoration: const InputDecoration(
                labelText: 'Стратегия доступа *',
                border: OutlineInputBorder(),
              ),
              items: _strategies
                  .map((s) => DropdownMenuItem(
                        value: s,
                        child: Text(_strategyLabels[s]!),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _unlockStrategy = v!),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _durationCtrl,
              decoration: const InputDecoration(
                labelText: 'Длительность (минуты)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return null;
                final n = int.tryParse(v.trim());
                if (n == null || n <= 0) return 'Введите положительное число';
                return null;
              },
            ),
            const SizedBox(height: 32),

            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : Text(isEdit ? 'Save' : 'Create course'),
            ),
          ],
        ),
      ),
    );
  }
}
