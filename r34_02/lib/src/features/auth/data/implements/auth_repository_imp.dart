import 'package:flutter_store_task_app/src/core/api/api.dart';
import 'package:flutter_store_task_app/src/core/constants/app_urls.dart';
import 'package:flutter_store_task_app/src/features/auth/data/models/user_model.dart';

import '../sources/sources.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  //final AuthRemoteDataSource remoteDataSource;
  final ApiClient _apiClient = ApiClient();

  //AuthRepositoryImp({required this.remoteDataSource});

  Future<UserModel> login(String username, String password) async {
    final response = await _apiClient.post(AppUrls.login, {
      'username': username,
      'password': password,
    });
    return UserModel.fromJson(response);
  }

  // ... example ...
  //
  // Future<User> getUser(String userId) async {
  //     return remoteDataSource.getUser(userId);
  //   }
  // ...
}
