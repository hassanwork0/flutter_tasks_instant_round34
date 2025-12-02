
import 'package:r34_16/src/features/entrypoint/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAllProducts();
  List<ProductEntity> searchProduct(String name, String category);
  List<ProductEntity> topSold(List<ProductEntity> products); //new items products
  List<ProductEntity> topViewed(List<ProductEntity> products); //popular products
}
