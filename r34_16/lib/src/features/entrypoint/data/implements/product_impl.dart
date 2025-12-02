import 'package:r34_16/src/features/entrypoint/data/sources/product_source.dart';
import 'package:r34_16/src/features/entrypoint/domain/entities/product_entity.dart';
import 'package:r34_16/src/features/entrypoint/domain/repositories/product_repository.dart';

class ProductImpl implements ProductRepository {
  final ProductSource source;

  ProductImpl(this.source);

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    return await source.getAllProducts();  
  }

  @override
  List<ProductEntity> searchProduct(String name, String category) {
    return source.searchProduct(name, category);  
  }

  @override
  List<ProductEntity> topSold(List<ProductEntity> products) {
    return source.topSold(products);  
  }

  @override
  List<ProductEntity> topViewed(List<ProductEntity> products) {
    return source.topViewed(products); 
  }
}
