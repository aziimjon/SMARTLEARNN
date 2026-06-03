import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/di/injection.dart';
import 'auth_notifier.dart';

final authNotifierProvider = ChangeNotifierProvider<AuthNotifier>(
  (ref) => getIt<AuthNotifier>(),
);
