abstract class LoginState {
  final bool isPasswordVisible;
  
  LoginState({
    this.isPasswordVisible = false,
  });
}

// الحالة الأولية
class LoginInitial extends LoginState {
  LoginInitial() : super(isPasswordVisible: false);
}

// حالة التحميل
class LoginLoading extends LoginState {
  LoginLoading() : super(isPasswordVisible: false);
}

// حالة النجاح
class LoginSuccess extends LoginState {
  final String userId;
  final String email;
  
  LoginSuccess({
    required this.userId,
    required this.email,
  }) : super(isPasswordVisible: false);
}

// حالة الخطأ
class LoginError extends LoginState {
  final String message;
  
  LoginError(this.message) : super(isPasswordVisible: false);
}

// حالة تحديث البيانات
class LoginUpdated extends LoginState {
  final String email;
  final String password;
  final bool isPasswordVisible;
  
  LoginUpdated({
    required this.email,
    required this.password,
    required this.isPasswordVisible,
  }) : super(isPasswordVisible: isPasswordVisible);
}