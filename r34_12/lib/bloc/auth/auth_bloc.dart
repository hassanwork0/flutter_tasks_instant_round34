import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market_app/bloc/auth/auth_event.dart';
import 'package:market_app/bloc/auth/auth_state.dart';
import 'package:market_app/bloc/user/user_bloc.dart';
import 'package:market_app/bloc/user/user_event.dart';
import 'package:market_app/model/user_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  final UserBloc userBloc;

  AuthBloc({required this.userBloc}) : super(AuthInitial()) {
    on<GoogleSignInEvent>(_googleSignInHandler);
    on<EmailSignInEvent>(_emailSignInHandler);
    on<EmailSignUpEvent>(_emailSignUpHandler);
    on<SignOutEvent>(_signOutHandler);
  }

  // تسجيل الدخول بجوجل
  Future<void> _googleSignInHandler(GoogleSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        final googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        await _googleSignIn.signOut();
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          emit(const AuthError('تم إلغاء عملية تسجيل الدخول'));
          return;
        }
        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(credential);
      }

      if (userCredential.user != null) {
        final user = _mapFirebaseUser(userCredential.user!);
        userBloc.add(LoginUserEvent(user));
        emit(AuthSuccess(user));
      }
    } catch (e) {
      emit(AuthError('فشل تسجيل الدخول بجوجل: $e'));
    }
  }

  // تسجيل الدخول بالإيميل والباسورد
  Future<void> _emailSignInHandler(EmailSignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (userCredential.user != null) {
        final user = _mapFirebaseUser(userCredential.user!);
        userBloc.add(LoginUserEvent(user));
        emit(AuthSuccess(user));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'فشل تسجيل الدخول'));
    }
  }

  // تسجيل حساب جديد
  Future<void> _emailSignUpHandler(EmailSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(event.name);
        final user = _mapFirebaseUser(userCredential.user!);
        userBloc.add(LoginUserEvent(user));
        emit(AuthSuccess(user));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'فشل إنشاء الحساب'));
    }
  }

  // تسجيل الخروج
  Future<void> _signOutHandler(SignOutEvent event, Emitter<AuthState> emit) async {
    if (!kIsWeb) await _googleSignIn.signOut();
    await _auth.signOut();
    userBloc.add(LogoutUserEvent());
    emit(AuthInitial());
  }

  UserModel _mapFirebaseUser(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? 'User',
      email: user.email ?? '',
      phone: user.phoneNumber ?? '',
      address: '',
      joinDate: DateTime.now(),
      profileImage: user.photoURL,
    );
  }
}
