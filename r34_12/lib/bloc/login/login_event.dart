abstract class LoginEvent {}

// حدث تحديث الإيميل
class UpdateEmail extends LoginEvent {
  final String email;
  UpdateEmail(this.email);
}

// حدث تحديث الباسورد
class UpdatePassword extends LoginEvent {
  final String password;
  UpdatePassword(this.password);
}

// حدث إظهار/إخفاء الباسورد
class TogglePasswordVisibility extends LoginEvent {}

// حدث إرسال بيانات تسجيل الدخول
class SubmitLogin extends LoginEvent {
  final String email;
  final String password;

  SubmitLogin({
    required this.email,
    required this.password,
  });
}