// cart_state.dart
import '../../entity/product.dart';

sealed class CartState {
  final List<Product> products;
  
  const CartState(this.products);
}

class CartInitial extends CartState { // Changed to non-const constructor
  CartInitial() : super([]);
}

class CartUpdated extends CartState { // Renamed to CartUpdated
  CartUpdated(super.products); // Changed to non-const constructor
}