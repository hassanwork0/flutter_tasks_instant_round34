import 'package:dartz/dartz.dart';
import 'package:flutter_store_task_app/domain/entities/product_entity.dart';
import 'package:flutter_store_task_app/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  // final ProductRemoteDataSource remoteDataSource;

  // ProductRepositoryImpl(this.remoteDataSource);

  // @override
  // Future<Either<Failure, ProductEntity>> getProductDetail(String productId) async {
  //   try {
  //     final model = await remoteDataSource.fetchProduct(productId);
  //     return Right(model); // Success
  //   } on ServerException {
  //     return Left(ServerFailure()); // Failure
  //   }
  // }
}
