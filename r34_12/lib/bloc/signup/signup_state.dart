// lib/bloc/signup/signup_state.dart
import 'package:market_app/model/user_model.dart';

abstract class SignUpState {
  final bool isPasswordVisible;
  final UserModel? user;
  
  SignUpState({
    this.isPasswordVisible = false,
    this.user,
  });
}

// الحالة الأولية
class SignUpInitial extends SignUpState {
  SignUpInitial() : super(isPasswordVisible: false);
}

// حالة التحميل
class SignUpLoading extends SignUpState {
  SignUpLoading() : super(isPasswordVisible: false);
}

// حالة النجاح
class SignUpSuccess extends SignUpState {
  final UserModel user;
  
  SignUpSuccess(this.user) : super(isPasswordVisible: false, user: user);
}

// حالة الخطأ
class SignUpError extends SignUpState {
  final String message;
  
  SignUpError(this.message) : super(isPasswordVisible: false);
}

// حالة تحديث البيانات
class SignUpUpdated extends SignUpState {
  final String username;
  final String email;
  final String password;
  final bool isPasswordVisible;
  
  SignUpUpdated({
    required this.username,
    required this.email,
    required this.password,
    required this.isPasswordVisible,
  }) : super(isPasswordVisible: isPasswordVisible);
}