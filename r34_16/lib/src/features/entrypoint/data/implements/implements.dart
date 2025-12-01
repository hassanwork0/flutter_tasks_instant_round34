
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class EntrypointRepositoryImp implements EntrypointRepository{

        final EntrypointRemoteDataSource remoteDataSource;
        EntrypointRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    