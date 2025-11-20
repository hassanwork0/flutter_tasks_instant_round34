import 'package:flutter/material.dart';
import 'package:flutter_store_task_app/src/features/auth/data/models/user_model.dart';
import 'package:flutter_store_task_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository _authRepository;

  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;

  AuthProvider({required AuthRepository authRepository})
    : _authRepository = authRepository;

  String? get errorMessage => _errorMessage;

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _user = await _authRepository.login(username, password);
      _isLoading = false;
      notifyListeners();
      return true; // Success
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return false; // Failure
    }
  }
}
