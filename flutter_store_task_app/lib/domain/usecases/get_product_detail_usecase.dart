// domain/usecases/get_product_detail_usecase.dart
import 'package:dartz/dartz.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';
//import '../../core/error/failures.dart';

class GetProductDetailUseCase {
  final ProductRepository repository;

  GetProductDetailUseCase(this.repository);

  // Future<Either<Failure, ProductEntity>> call(String productId) async {
  //   // Business logic goes here (e.g., validation, logging)
  //   return repository.getProductDetail(productId);
  // }
}
