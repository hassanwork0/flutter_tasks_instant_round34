import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  String email = '';
  String password = '';
  bool isPasswordVisible = false;

  LoginBloc() : super(LoginInitial()) {
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SubmitLogin>(_onSubmitLogin);
  }

  // تحديث الإيميل
  void _onUpdateEmail(UpdateEmail event, Emitter<LoginState> emit) {
    email = event.email;
    emit(LoginUpdated(
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // تحديث الباسورد
  void _onUpdatePassword(UpdatePassword event, Emitter<LoginState> emit) {
    password = event.password;
    emit(LoginUpdated(
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // إظهار/إخفاء الباسورد
  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<LoginState> emit) {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginUpdated(
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // إرسال بيانات تسجيل الدخول
  void _onSubmitLogin(SubmitLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    
    try {
      // 1. سجل الدخول في Firebase
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      
      // 2. خد بيانات المستخدم
      final String userId = userCredential.user!.uid;
      final String userEmail = userCredential.user!.email ?? event.email;
      
      // 3. أخبر الـ state أن تسجيل الدخول نجح
      emit(LoginSuccess(
        userId: userId,
        email: userEmail,
      ));
      
      print('Login successful: $userEmail');
      
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      
      switch (e.code) {
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'user-disabled':
          errorMessage = 'This account has been disabled';
          break;
        case 'user-not-found':
          errorMessage = 'No account found with this email';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many attempts. Try again later';
          break;
        case 'network-request-failed':
          errorMessage = 'Network error. Check your connection';
          break;
        default:
          errorMessage = 'Login failed: ${e.message}';
      }
      
      emit(LoginError(errorMessage));
      print(' Login error: $errorMessage');
      
    } catch (e) {
      emit(LoginError('An unexpected error occurred'));
      print(' Unexpected error: $e');
    }
  }
}