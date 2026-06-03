import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/admin_providers.dart';

class AdminGenerateSessionsScreen extends ConsumerStatefulWidget {
  final String groupId;
  final String groupName;

  const AdminGenerateSessionsScreen({
    super.key,
    required this.groupId,
    required this.groupName,
  });

  @override
  ConsumerState<AdminGenerateSessionsScreen> createState() =>
      _AdminGenerateSessionsScreenState();
}

class _AdminGenerateSessionsScreenState
    extends ConsumerState<AdminGenerateSessionsScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;
  bool _loading = false;

  static final _fmt = DateFormat('dd.MM.yyyy');

  Future<void> _pickDate({required bool isFrom}) async {
    final now = DateTime.now();
    final initial = isFrom
        ? (_fromDate ?? now)
        : (_toDate ?? (_fromDate ?? now).add(const Duration(days: 30)));

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 2),
    );
    if (picked == null) return;
    setState(() {
      if (isFrom) {
        _fromDate = picked;
        if (_toDate != null && _toDate!.isBefore(picked)) {
          _toDate = null;
        }
      } else {
        _toDate = picked;
      }
    });
  }

  Future<void> _submit() async {
    if (_fromDate == null || _toDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Укажите обе даты')),
      );
      return;
    }
    if (_toDate!.isBefore(_fromDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Дата окончания раньше начала')),
      );
      return;
    }
    setState(() => _loading = true);

    final result = await ref
        .read(adminGroupRepositoryProvider)
        .generateSessions(
          widget.groupId,
          fromDate: _fromDate!,
          toDate: _toDate!,
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
    return Scaffold(
      appBar: AppBar(title: Text('Сессии: ${widget.groupName}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Выберите период для генерации занятий',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            const SizedBox(height: 24),

            // Дата начала
            InkWell(
              onTap: () => _pickDate(isFrom: true),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Дата начала *',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                ),
                child: Text(
                  _fromDate != null ? _fmt.format(_fromDate!) : 'Выберите дату...',
                  style: TextStyle(
                    color: _fromDate == null
                        ? Theme.of(context).colorScheme.outline
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Дата окончания
            InkWell(
              onTap: () => _pickDate(isFrom: false),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Дата окончания *',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                ),
                child: Text(
                  _toDate != null ? _fmt.format(_toDate!) : 'Выберите дату...',
                  style: TextStyle(
                    color: _toDate == null
                        ? Theme.of(context).colorScheme.outline
                        : null,
                  ),
                ),
              ),
            ),

            if (_fromDate != null && _toDate != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withAlpha(80),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Период: ${_fmt.format(_fromDate!)} — ${_fmt.format(_toDate!)}'
                  ' (${_toDate!.difference(_fromDate!).inDays + 1} дн.)',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],

            const Spacer(),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Text('Сгенерировать сессии'),
            ),
          ],
        ),
      ),
    );
  }
}
