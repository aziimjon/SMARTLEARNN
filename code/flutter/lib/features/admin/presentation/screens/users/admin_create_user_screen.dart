import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/admin_providers.dart';

class AdminCreateUserScreen extends ConsumerStatefulWidget {
  const AdminCreateUserScreen({super.key});

  @override
  ConsumerState<AdminCreateUserScreen> createState() =>
      _AdminCreateUserScreenState();
}

class _AdminCreateUserScreenState
    extends ConsumerState<AdminCreateUserScreen> {
  // Role UUID constants (synced with DB seed)
  static const _roles = [
    _RoleOption('Студент',        '33333333-3333-3333-3333-333333333333'),
    _RoleOption('Teacher',        '22222222-2222-2222-2222-222222222222'),
    _RoleOption('Администратор',  '11111111-1111-1111-1111-111111111111'),
    _RoleOption('Суперадминистратор', '97e73d5e-6fd6-4deb-b58e-7825a3f2a4dd'),
  ];

  final _formKey = GlobalKey<FormState>();
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _middleNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  String _gender = 'MALE';
  String _status = 'ACTIVE';
  String _roleId = '33333333-3333-3333-3333-333333333333';
  bool _obscurePassword = true;
  bool _isSaving = false;

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _middleNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);

    final result = await ref.read(userRepositoryProvider).createUser(
          firstName: _firstNameCtrl.text.trim(),
          lastName: _lastNameCtrl.text.trim(),
          middleName: _middleNameCtrl.text.trim(),
          gender: _gender,
          phoneNumber: _phoneCtrl.text.trim(),
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
          status: _status,
          roleId: _roleId,
        );

    setState(() => _isSaving = false);

    result.fold(
      (f) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(f.message), backgroundColor: Colors.red),
      ),
      (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Пользователь создан'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Создать пользователя')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ── Имя / Фамилия ───────────────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: _Field(
                    controller: _firstNameCtrl,
                    label: 'First name',
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Обязательно' : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _Field(
                    controller: _lastNameCtrl,
                    label: 'Last name',
                    validator: (v) =>
                        (v == null || v.isEmpty) ? 'Обязательно' : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _Field(
              controller: _middleNameCtrl,
              label: 'Отчество (необязательно)',
            ),
            const SizedBox(height: 12),

            // ── Пол ─────────────────────────────────────────────────────────
            Text('Пол', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Мужской'),
                    value: 'MALE',
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v!),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Женский'),
                    value: 'FEMALE',
                    groupValue: _gender,
                    onChanged: (v) => setState(() => _gender = v!),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // ── Email / Phone ────────────────────────────────────────────────
            _Field(
              controller: _emailCtrl,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Обязательно';
                if (!v.contains('@')) return 'Некорректный email';
                return null;
              },
            ),
            const SizedBox(height: 12),
            _Field(
              controller: _phoneCtrl,
              label: 'Phone',
              keyboardType: TextInputType.phone,
              validator: (v) =>
                  (v == null || v.length < 7) ? 'Минимум 7 символов' : null,
            ),
            const SizedBox(height: 12),

            // ── Пароль ───────────────────────────────────────────────────────
            TextFormField(
              controller: _passwordCtrl,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              validator: (v) =>
                  (v == null || v.length < 8) ? 'Минимум 8 символов' : null,
            ),
            const SizedBox(height: 12),

            // ── Статус ───────────────────────────────────────────────────────
            DropdownButtonFormField<String>(
              value: _status,
              decoration: const InputDecoration(
                labelText: 'Статус',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'ACTIVE', child: Text('ACTIVE')),
                DropdownMenuItem(value: 'INACTIVE', child: Text('INACTIVE')),
                DropdownMenuItem(value: 'BLOCKED', child: Text('BLOCKED')),
              ],
              onChanged: (v) => setState(() => _status = v!),
            ),
            const SizedBox(height: 12),

            // ── Роль ─────────────────────────────────────────────────────────
            DropdownButtonFormField<String>(
              value: _roleId,
              decoration: const InputDecoration(
                labelText: 'Role',
                border: OutlineInputBorder(),
              ),
              items: _roles
                  .map((r) => DropdownMenuItem(
                        value: r.id,
                        child: Text(r.label),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _roleId = v!),
              validator: (v) =>
                  (v == null || v.isEmpty) ? 'Выберите роль' : null,
            ),
            const SizedBox(height: 24),

            // ── Submit ───────────────────────────────────────────────────────
            FilledButton(
              onPressed: _isSaving ? null : _submit,
              child: _isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Создать пользователя'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _Field({
    required this.controller,
    required this.label,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}

class _RoleOption {
  final String label;
  final String id;
  const _RoleOption(this.label, this.id);
}
