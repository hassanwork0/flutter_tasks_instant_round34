import 'package:r34_16/src/features/entrypoint/domain/entities/product_entity.dart';
import 'package:r34_16/src/features/entrypoint/domain/repositories/product_repository.dart';


class SearchProductUseCase {
  final ProductRepository repository;

  SearchProductUseCase(this.repository);

  List<ProductEntity> call(String name, String category) {
    return repository.searchProduct(name, category);
  }
}
