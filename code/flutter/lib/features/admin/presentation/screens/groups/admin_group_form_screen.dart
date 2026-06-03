import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../groups/data/models/group_response.dart';
import '../../providers/admin_providers.dart';

class AdminGroupFormScreen extends ConsumerStatefulWidget {
  final GroupResponse? group;

  const AdminGroupFormScreen({super.key, this.group});

  @override
  ConsumerState<AdminGroupFormScreen> createState() =>
      _AdminGroupFormScreenState();
}

class _AdminGroupFormScreenState extends ConsumerState<AdminGroupFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final _nameCtrl =
      TextEditingController(text: widget.group?.name ?? '');
  late final _capacityCtrl = TextEditingController(
    text: widget.group != null ? '${widget.group!.capacity}' : '',
  );

  late String? _courseId = widget.group?.courseId;
  late String _courseName = widget.group?.courseName ?? '';
  late String? _teacherId = widget.group?.teacher.teacherId;
  late String _teacherName = widget.group != null
      ? '${widget.group!.teacher.firstName} ${widget.group!.teacher.lastName}'
      : '';
  late String _scheduleType = widget.group?.scheduleType ?? 'EXACT_DAYS';
  late List<String> _scheduleDays =
      List<String>.from(widget.group?.scheduleDays ?? []);
  late bool _active = widget.group?.active ?? true;
  late String _status = widget.group?.status ?? 'FORMING';

  bool _loading = false;

  static const _scheduleTypes = ['EXACT_DAYS', 'ODD_DAYS', 'EVEN_DAYS'];
  static const _scheduleTypeLabels = {
    'EXACT_DAYS': 'Конкретные дни',
    'ODD_DAYS': 'Нечётные дни',
    'EVEN_DAYS': 'Чётные дни',
  };
  static const _statuses = ['FORMING', 'ACTIVE', 'FINISHED', 'CANCELLED'];
  static const _statusLabels = {
    'FORMING': 'Recruiting',
    'ACTIVE': 'Active',
    'FINISHED': 'Completed',
    'CANCELLED': 'Отменена',
  };
  static const _allDays = [
    'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY',
    'FRIDAY', 'SATURDAY', 'SUNDAY',
  ];
  static const _dayLabels = {
    'MONDAY': 'Пн', 'TUESDAY': 'Вт', 'WEDNESDAY': 'Ср',
    'THURSDAY': 'Чт', 'FRIDAY': 'Пт', 'SATURDAY': 'Сб', 'SUNDAY': 'Вс',
  };

  @override
  void dispose() {
    _nameCtrl.dispose();
    _capacityCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickCourse() async {
    final result = await showModalBottomSheet<(String, String)?>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _CoursePickerSheet(),
    );
    if (result != null) {
      setState(() {
        _courseId = result.$1;
        _courseName = result.$2;
      });
    }
  }

  Future<void> _pickTeacher() async {
    final result = await showModalBottomSheet<(String, String)?>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _TeacherPickerSheet(),
    );
    if (result != null) {
      setState(() {
        _teacherId = result.$1;
        _teacherName = result.$2;
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_courseId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Выберите курс')));
      return;
    }
    if (_teacherId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Выберите преподавателя')));
      return;
    }
    setState(() => _loading = true);

    final repo = ref.read(adminGroupRepositoryProvider);
    final capacity = int.parse(_capacityCtrl.text.trim());
    final days = _scheduleType == 'EXACT_DAYS' ? _scheduleDays : <String>[];

    final result = widget.group == null
        ? await repo.createGroup(
            name: _nameCtrl.text.trim(),
            courseId: _courseId!,
            teacherId: _teacherId!,
            capacity: capacity,
            scheduleType: _scheduleType,
            scheduleDays: days,
            active: _active,
          )
        : await repo.updateGroup(
            widget.group!.id,
            name: _nameCtrl.text.trim(),
            courseId: _courseId!,
            teacherId: _teacherId!,
            capacity: capacity,
            scheduleType: _scheduleType,
            scheduleDays: days,
            status: _status,
            active: _active,
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
    final isEdit = widget.group != null;
    return Scaffold(
      appBar: AppBar(
          title: Text(isEdit ? 'Редактировать группу' : 'Новая группа')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Название
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Название *',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Обязательное поле' : null,
            ),
            const SizedBox(height: 12),

            // Курс
            InkWell(
              onTap: _pickCourse,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Курс *',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                child: Text(
                  _courseName.isEmpty ? 'Выберите курс...' : _courseName,
                  style: TextStyle(
                    color: _courseName.isEmpty
                        ? Theme.of(context).colorScheme.outline
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Преподаватель
            InkWell(
              onTap: _pickTeacher,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Преподаватель *',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                child: Text(
                  _teacherName.isEmpty
                      ? 'Выберите преподавателя...'
                      : _teacherName,
                  style: TextStyle(
                    color: _teacherName.isEmpty
                        ? Theme.of(context).colorScheme.outline
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Вместимость
            TextFormField(
              controller: _capacityCtrl,
              decoration: const InputDecoration(
                labelText: 'Вместимость *',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Обязательное поле';
                final n = int.tryParse(v.trim());
                if (n == null || n < 1) return 'Минимум 1';
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Тип расписания
            DropdownButtonFormField<String>(
              value: _scheduleType,
              decoration: const InputDecoration(
                labelText: 'Тип расписания *',
                border: OutlineInputBorder(),
              ),
              items: _scheduleTypes
                  .map((t) => DropdownMenuItem(
                        value: t,
                        child: Text(_scheduleTypeLabels[t]!),
                      ))
                  .toList(),
              onChanged: (v) => setState(() {
                _scheduleType = v!;
                if (v != 'EXACT_DAYS') _scheduleDays.clear();
              }),
            ),

            // Дни недели (только EXACT_DAYS)
            if (_scheduleType == 'EXACT_DAYS') ...[
              const SizedBox(height: 12),
              Text(
                'Дни недели',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _allDays.map((day) {
                  final selected = _scheduleDays.contains(day);
                  return FilterChip(
                    label: Text(_dayLabels[day]!),
                    selected: selected,
                    onSelected: (v) => setState(() {
                      v
                          ? _scheduleDays.add(day)
                          : _scheduleDays.remove(day);
                    }),
                  );
                }).toList(),
              ),
            ],

            const SizedBox(height: 12),

            // Активна
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Active'),
              value: _active,
              onChanged: (v) => setState(() => _active = v),
            ),

            // Статус (только редактирование)
            if (isEdit) ...[
              const SizedBox(height: 4),
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
            ],

            const SizedBox(height: 24),
            FilledButton(
              onPressed: _loading ? null : _submit,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : Text(isEdit ? 'Save' : 'Создать'),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Course picker bottom sheet ────────────────────────────────────────────────

class _CoursePickerSheet extends ConsumerStatefulWidget {
  const _CoursePickerSheet();

  @override
  ConsumerState<_CoursePickerSheet> createState() => _CoursePickerSheetState();
}

class _CoursePickerSheetState extends ConsumerState<_CoursePickerSheet> {
  final _searchCtrl = TextEditingController();
  String _search = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(coursePickerListProvider(_search));
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchCtrl,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Поиск курса...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
              data: (courses) => ListView.builder(
                itemCount: courses.length,
                itemBuilder: (ctx, i) {
                  final c = courses[i];
                  return ListTile(
                    title: Text(c.title),
                    subtitle: Text(c.level,
                        style: const TextStyle(fontSize: 12)),
                    onTap: () => Navigator.pop(context, (c.id, c.title)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Teacher picker bottom sheet ───────────────────────────────────────────────

class _TeacherPickerSheet extends ConsumerStatefulWidget {
  const _TeacherPickerSheet();

  @override
  ConsumerState<_TeacherPickerSheet> createState() =>
      _TeacherPickerSheetState();
}

class _TeacherPickerSheetState extends ConsumerState<_TeacherPickerSheet> {
  final _searchCtrl = TextEditingController();
  String _search = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(teacherPickerListProvider(_search));
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchCtrl,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Поиск преподавателя...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
              data: (teachers) => ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (ctx, i) {
                  final t = teachers[i];
                  return ListTile(
                    title: Text(t.fullName),
                    subtitle: Text(
                      t.position ?? '—',
                      style: const TextStyle(fontSize: 12),
                    ),
                    onTap: () =>
                        Navigator.pop(context, (t.teacherId, t.fullName)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
