import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../auth/data/models/permission.dart';
import '../../providers/admin_providers.dart';

class AdminPermissionFormScreen extends ConsumerStatefulWidget {
  final Permission? permission;

  const AdminPermissionFormScreen({super.key, this.permission});

  @override
  ConsumerState<AdminPermissionFormScreen> createState() =>
      _AdminPermissionFormScreenState();
}

class _AdminPermissionFormScreenState
    extends ConsumerState<AdminPermissionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _categoryCtrl;
  bool _loading = false;
  String? _error;

  bool get _isEdit => widget.permission != null;

  static const _suggestedCategories = [
    'USER',
    'COURSE',
    'GROUP',
    'ADMIN',
    'REPORT',
  ];

  @override
  void initState() {
    super.initState();
    _nameCtrl =
        TextEditingController(text: widget.permission?.name ?? '');
    _categoryCtrl =
        TextEditingController(text: widget.permission?.category ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _categoryCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });

    bool ok;
    if (_isEdit) {
      ok = await ref
          .read(adminPermissionsNotifierProvider.notifier)
          .updatePermission(
            widget.permission!.id,
            _nameCtrl.text.trim(),
            _categoryCtrl.text.trim().toUpperCase(),
          );
    } else {
      ok = await ref
          .read(adminPermissionsNotifierProvider.notifier)
          .createPermission(
            _nameCtrl.text.trim(),
            _categoryCtrl.text.trim().toUpperCase(),
          );
    }

    if (!mounted) return;
    setState(() => _loading = false);

    if (ok) {
      Navigator.pop(context, true);
    } else {
      setState(() => _error = 'Ошибка сохранения. Проверьте данные.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Редактировать право' : 'Создать право'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Название права',
                hintText: 'Например: READ_USERS',
                prefixIcon: Icon(Icons.key_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.characters,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Введите название';
                if (v.trim().length < 2) return 'Минимум 2 символа';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _categoryCtrl,
              decoration: const InputDecoration(
                labelText: 'Категория',
                hintText: 'Например: USER',
                prefixIcon: Icon(Icons.category_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.characters,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Введите категорию';
                return null;
              },
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              children: _suggestedCategories
                  .map(
                    (c) => ActionChip(
                      label: Text(c, style: const TextStyle(fontSize: 12)),
                      onPressed: () =>
                          setState(() => _categoryCtrl.text = c),
                    ),
                  )
                  .toList(),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(
                _error!,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(_isEdit ? 'Save' : 'Создать'),
            ),
          ],
        ),
      ),
    );
  }
}
