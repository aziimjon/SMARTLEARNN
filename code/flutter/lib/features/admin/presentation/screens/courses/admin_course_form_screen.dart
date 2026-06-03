import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../courses/data/models/course_response.dart';
import '../../providers/admin_providers.dart';

class AdminCourseFormScreen extends ConsumerStatefulWidget {
  final CourseResponse? course;

  const AdminCourseFormScreen({super.key, this.course});

  @override
  ConsumerState<AdminCourseFormScreen> createState() =>
      _AdminCourseFormScreenState();
}

class _AdminCourseFormScreenState extends ConsumerState<AdminCourseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _titleCtrl =
      TextEditingController(text: widget.course?.title ?? '');
  late final _descCtrl =
      TextEditingController(text: widget.course?.description ?? '');
  late final _durationCtrl = TextEditingController(
    text: widget.course != null ? '${widget.course!.durationInMinutes}' : '',
  );
  late String _level = widget.course?.level ?? 'BEGINNER';
  bool _loading = false;

  static const _levels = ['BEGINNER', 'INTERMEDIATE', 'ADVANCED'];
  static const _levelLabels = {
    'BEGINNER': 'Beginner',
    'INTERMEDIATE': 'Intermediate',
    'ADVANCED': 'Advanced',
  };

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    _durationCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final repo = ref.read(adminCourseRepositoryProvider);
    final title = _titleCtrl.text.trim();
    final desc =
        _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim();
    final duration = int.parse(_durationCtrl.text.trim());

    final result = widget.course == null
        ? await repo.createCourse(
            title: title,
            description: desc,
            level: _level,
            durationInMinutes: duration,
          )
        : await repo.updateCourse(
            widget.course!.id,
            title: title,
            description: desc,
            level: _level,
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
    final isEdit = widget.course != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Редактировать курс' : 'Новый курс')),
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
              controller: _descCtrl,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
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
            const SizedBox(height: 24),
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
