// lib/bloc/signup/signup_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_app/model/user_model.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  String username = '';
  String email = '';
  String password = '';
  String phone = '';
  String address = '';
  bool isPasswordVisible = false;

  SignUpBloc() : super(SignUpInitial()) {
    on<UpdateUsername>(_onUpdateUsername);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<UpdatePhone>(_onUpdatePhone);
    on<UpdateAddress>(_onUpdateAddress);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SubmitSignUp>(_onSubmitSignUp);
  }

  // تحديث الاسم
  void _onUpdateUsername(UpdateUsername event, Emitter<SignUpState> emit) {
    username = event.username;
    emit(SignUpUpdated(
      username: username,
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // تحديث الإيميل
  void _onUpdateEmail(UpdateEmail event, Emitter<SignUpState> emit) {
    email = event.email;
    emit(SignUpUpdated(
      username: username,
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // تحديث الباسورد
  void _onUpdatePassword(UpdatePassword event, Emitter<SignUpState> emit) {
    password = event.password;
    emit(SignUpUpdated(
      username: username,
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // تحديث التليفون
  void _onUpdatePhone(UpdatePhone event, Emitter<SignUpState> emit) {
    phone = event.phone;
    emit(SignUpUpdated(
      username: username,
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // تحديث العنوان
  void _onUpdateAddress(UpdateAddress event, Emitter<SignUpState> emit) {
    address = event.address;
    emit(SignUpUpdated(
      username: username,
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // إظهار/إخفاء الباسورد
  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<SignUpState> emit) {
    isPasswordVisible = !isPasswordVisible;
    emit(SignUpUpdated(
      username: username,
      email: email,
      password: password,
      isPasswordVisible: isPasswordVisible,
    ));
  }

  // إرسال بيانات التسجيل
  void _onSubmitSignUp(SubmitSignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    
    try {
      // 1. أنشئ حساب في Firebase
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      
      // 2. خد الـ User ID من Firebase
      final String userId = userCredential.user!.uid;
      
      // 3. أنشئ UserModel
      final user = UserModel(
        id: userId,
        name: event.name,
        email: event.email,
        phone: event.phone,
        address: event.address,
        joinDate: DateTime.now(),
      );
      
      // 4. أخبر الـ state أن التسجيل نجح
      emit(SignUpSuccess(user));
      
      print(' Sign up successful: ${user.email}');
      
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'This email is already registered';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email address';
          break;
        case 'weak-password':
          errorMessage = 'Password is too weak';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Email/password accounts are not enabled';
          break;
        default:
          errorMessage = 'An error occurred: ${e.message}';
      }
      
      emit(SignUpError(errorMessage));
      print(' Sign up error: $errorMessage');
      
    } catch (e) {
      emit(SignUpError('An unexpected error occurred'));
      print(' Unexpected error: $e');
    }
  }
}