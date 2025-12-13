import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:market_app/model/user_model.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoginUserEvent>(_onLoginUser);
    on<LoadUserEvent>(_onLoadUser);
    on<UpdateUserEvent>(_onUpdateUser);
    on<LogoutUserEvent>(_onLogoutUser);

    // تحميل المستخدم من SharedPreferences عند إنشاء الـ Bloc
    _loadInitialUser();
  }

  // تحميل المستخدم من التخزين المحلي عند البداية
  Future<void> _loadInitialUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('user_id');

      if (userId != null) {
        final user = UserModel(
          id: userId,
          name: prefs.getString('user_name') ?? '',
          email: prefs.getString('user_email') ?? '',
          phone: prefs.getString('user_phone') ?? '',
          address: prefs.getString('user_address') ?? '',
          joinDate: DateTime.parse(
              prefs.getString('user_joinDate') ?? DateTime.now().toIso8601String()),
          profileImage: prefs.getString('user_profileImage'),
        );

        emit(UserLoaded(user));
        print('[UserBloc] User loaded from storage: ${user.name}');
      }
    } catch (e) {
      print('[UserBloc] Error loading user: $e');
    }
  }

  // تسجيل دخول المستخدم
  Future<void> _onLoginUser(LoginUserEvent event, Emitter<UserState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', event.user.id);
      await prefs.setString('user_name', event.user.name);
      await prefs.setString('user_email', event.user.email);
      await prefs.setString('user_phone', event.user.phone);
      await prefs.setString('user_address', event.user.address);
      await prefs.setString('user_joinDate', event.user.joinDate.toIso8601String());

      if (event.user.profileImage != null) {
        await prefs.setString('user_profileImage', event.user.profileImage!);
      }

      emit(UserLoaded(event.user));
      print('[UserBloc] User saved to storage: ${event.user.name}');
    } catch (e) {
      print('[UserBloc] Error saving user: $e');
      emit(UserError('فشل حفظ بيانات المستخدم'));
    }
  }

  // تحميل بيانات المستخدم من SharedPreferences عند الطلب
  Future<void> _onLoadUser(LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('user_id');

      if (userId != null) {
        final user = UserModel(
          id: userId,
          name: prefs.getString('user_name') ?? '',
          email: prefs.getString('user_email') ?? '',
          phone: prefs.getString('user_phone') ?? '',
          address: prefs.getString('user_address') ?? '',
          joinDate: DateTime.parse(
              prefs.getString('user_joinDate') ?? DateTime.now().toIso8601String()),
          profileImage: prefs.getString('user_profileImage'),
        );

        emit(UserLoaded(user));
        print('[UserBloc] User loaded: ${user.name}');
      } else {
        emit(UserInitial());
      }
    } catch (e) {
      emit(UserError('فشل تحميل بيانات المستخدم: $e'));
    }
  }

  // تحديث بيانات المستخدم
  Future<void> _onUpdateUser(UpdateUserEvent event, Emitter<UserState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', event.user.name);
      await prefs.setString('user_email', event.user.email);
      await prefs.setString('user_phone', event.user.phone);
      await prefs.setString('user_address', event.user.address);

      emit(UserLoaded(event.user));
      print('[UserBloc] User updated: ${event.user.name}');
    } catch (e) {
      print('[UserBloc] Error updating user: $e');
      emit(UserError('فشل تحديث بيانات المستخدم'));
    }
  }

  // تسجيل خروج المستخدم
  Future<void> _onLogoutUser(LogoutUserEvent event, Emitter<UserState> emit) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      emit(UserInitial());
      print('[UserBloc] User logged out');
    } catch (e) {
      print('[UserBloc] Error logging out: $e');
      emit(UserError('فشل تسجيل الخروج'));
    }
  }
}
