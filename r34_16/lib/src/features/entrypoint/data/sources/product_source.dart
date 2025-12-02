import 'dart:convert';

import 'package:r34_16/src/core/api/api.dart';
import 'package:r34_16/src/core/utils/pastebin_dart_api/usecases/show_paste.dart';
import 'package:r34_16/src/features/entrypoint/data/models/product_model.dart';
import 'package:r34_16/src/features/entrypoint/domain/entities/product_entity.dart';

abstract class ProductSource {
  Future<List<ProductEntity>> getAllProducts();
  List<ProductEntity> searchProduct(String name, String category);
  List<ProductEntity> topSold(List<ProductEntity> products);
  List<ProductEntity> topViewed(List<ProductEntity> products);

  
  Future<ProductEntity> getProductDetails(String id);
}

class ProductSourceImp extends ProductSource {
  @override
  Future<List<ProductEntity>> getAllProducts() async {
    List<ProductEntity> products = [];
    String response = await showPaste(pasteKey: Api.storeAPI);

    List<dynamic> json = jsonDecode(response);
    for (var element in json) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<ProductEntity> getProductDetails(String id) async {
    String response = await showPaste(pasteKey: Api.storeAPI);
    List<dynamic> json = jsonDecode(response);

    
    final productJson = json.firstWhere(
      (element) => element['id'].toString() == id,
      orElse: () => null,
    );

    if (productJson == null) {
      throw Exception("Product not found");
    }

    return ProductModel.fromJson(productJson);
  }

  @override
  List<ProductEntity> searchProduct(String name, String category) {
    throw UnimplementedError();
  }

  @override
List<ProductEntity> topSold(List<ProductEntity> products) {
  final sorted = List<ProductEntity>.from(products)
    ..sort((a, b) => b.sold.compareTo(a.sold));
  return sorted.take(10).toList(); 
}


  @override
List<ProductEntity> topViewed(List<ProductEntity> products) {
  final sorted = List<ProductEntity>.from(products)
    ..sort((a, b) => b.views.compareTo(a.views));
  return sorted.take(10).toList(); 
}

}
