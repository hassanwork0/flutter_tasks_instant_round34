import 'package:r34_16/src/features/entrypoint/domain/entities/product_entity.dart';
import 'package:r34_16/src/features/entrypoint/domain/repositories/product_repository.dart';


class TopViewedUseCase {
  final ProductRepository repository;

  TopViewedUseCase(this.repository);

  List<ProductEntity> call(List<ProductEntity> products) {
    return repository.topViewed(products);
  }
}
