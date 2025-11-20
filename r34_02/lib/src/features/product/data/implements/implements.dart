
    import '../sources/sources.dart';
    import '../../domain/repositories/repositories.dart';
    
    class ProductRepositoryImp implements ProductRepository{

        final ProductRemoteDataSource remoteDataSource;
        ProductRepositoryImp({required this.remoteDataSource});
      
        // ... example ...
        //
        // Future<User> getUser(String userId) async {
        //     return remoteDataSource.getUser(userId);
        //   }
        // ...
    }
    