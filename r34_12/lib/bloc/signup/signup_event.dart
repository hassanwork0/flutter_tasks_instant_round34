// lib/bloc/signup/signup_event.dart


abstract class SignUpEvent {}

// حدث تحديث الاسم
class UpdateUsername extends SignUpEvent {
  final String username;
  UpdateUsername(this.username);
}

// حدث تحديث الإيميل
class UpdateEmail extends SignUpEvent {
  final String email;
  UpdateEmail(this.email);
}

// حدث تحديث الباسورد
class UpdatePassword extends SignUpEvent {
  final String password;
  UpdatePassword(this.password);
}

// حدث تحديث التليفون
class UpdatePhone extends SignUpEvent {
  final String phone;
  UpdatePhone(this.phone);
}

// حدث تحديث العنوان
class UpdateAddress extends SignUpEvent {
  final String address;
  UpdateAddress(this.address);
}

// حدث إظهار/إخفاء الباسورد
class TogglePasswordVisibility extends SignUpEvent {}

// حدث إرسال بيانات التسجيل
class SubmitSignUp extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;

  SubmitSignUp({
    required this.name,
    required this.email,
    required this.password,
    this.phone = '',
    this.address = '',
  });
}