import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../auth/data/models/role.dart';
import '../../providers/admin_providers.dart';

class AdminRoleFormScreen extends ConsumerStatefulWidget {
  final Role? role;

  const AdminRoleFormScreen({super.key, this.role});

  @override
  ConsumerState<AdminRoleFormScreen> createState() =>
      _AdminRoleFormScreenState();
}

class _AdminRoleFormScreenState extends ConsumerState<AdminRoleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  bool _loading = false;
  String? _error;

  bool get _isEdit => widget.role != null;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.role?.name ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
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
          .read(adminRolesNotifierProvider.notifier)
          .updateRole(widget.role!.id, _nameCtrl.text.trim());
    } else {
      ok = await ref
          .read(adminRolesNotifierProvider.notifier)
          .createRole(_nameCtrl.text.trim());
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
        title: Text(_isEdit ? 'Редактировать роль' : 'Создать роль'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Название роли',
                hintText: 'Например: MANAGER',
                prefixIcon: Icon(Icons.shield_outlined),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.characters,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Введите название';
                if (v.trim().length < 2) return 'Минимум 2 символа';
                return null;
              },
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
