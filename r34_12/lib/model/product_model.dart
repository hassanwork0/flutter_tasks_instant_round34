import '../entity/product.dart';
class ProductModel extends Product {
  ProductModel({
    required int id,
    required String title,
    required String description,
    required String category,
    required double price,
    required String image,
    required int sold,
    required int views,
    required int qty,
  }) : super(
          id: id,
          title: title,
          description: description,
          category: category,
          price: price,
          image: image,
          sold: sold,
          views: views,
          qty:qty,

        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: json['image'] ?? '',
      sold: json['sold'] ?? 0,
      views: json['views'] ?? 0,
      qty: json['qty'] ?? 0
      

    );
  }
}