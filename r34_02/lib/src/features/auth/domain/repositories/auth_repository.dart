import 'package:flutter_store_task_app/src/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  // Future<User> getUser(String userId);
  Future<UserModel> login(String username, String password);
}
