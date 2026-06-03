import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/storage/secure_storage.dart';
import '../../data/models/auth_me.dart';
import '../../domain/repositories/auth_repository.dart';

@lazySingleton
class AuthNotifier extends ChangeNotifier {
  final AuthRepository _authRepository;
  final SecureStorage _secureStorage;

  AuthNotifier(this._authRepository, this._secureStorage);

  AuthMe? _user;
  bool _isLoading = false;
  bool _isLoadingMe = false;
  String? _errorMessage;

  AuthMe? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final loginResult = await _authRepository.login(username, password);

    await loginResult.fold(
      (failure) async {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (token) async {
        await _secureStorage.saveToken(token);

        final meResult = await _authRepository.getMe();
        meResult.fold(
          (failure) {
            _errorMessage = failure.message;
            _isLoading = false;
            notifyListeners();
          },
          (authMe) {
            _user = authMe;
            _isLoading = false;
            notifyListeners();
          },
        );
      },
    );
  }

  Future<void> logout() async {
    await _authRepository.logout();
    await _secureStorage.deleteToken();
    _user = null;
    notifyListeners();
  }

  Future<bool> updateProfile(Map<String, dynamic> data) async {
    final result = await _authRepository.updateMe(data);
    return result.fold(
      (_) => false,
      (authMe) {
        _user = authMe;
        notifyListeners();
        return true;
      },
    );
  }

  Future<void> loadCurrentUser() async {
    if (_isLoadingMe) return;
    final token = await _secureStorage.getToken();
    if (token == null) return;

    _isLoadingMe = true;
    final result = await _authRepository.getMe();
    _isLoadingMe = false;

    result.fold(
      (failure) => null,
      (authMe) {
        _user = authMe;
        notifyListeners();
      },
    );
  }
}
