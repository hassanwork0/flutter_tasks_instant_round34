
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class Login_or_signupRepositoryImp implements Login_or_signupRepository{

        final Login_or_signupRemoteDataSource remoteDataSource;
        Login_or_signupRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    