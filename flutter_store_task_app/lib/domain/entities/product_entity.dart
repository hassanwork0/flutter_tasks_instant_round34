// domain/entities/product_entity.dart
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final double price;
  final String description;
  final double rating;
  // ... other fields like imageUrl

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
  });

  @override
  List<Object?> get props => [id, name, price, rating];
}
