import '../../entity/product.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Product product;
  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final Product product;
  RemoveFromCart(this.product);
}

class IncreaseQty extends CartEvent {
  final Product product;
  IncreaseQty(this.product);
}

class DecreaseQty extends CartEvent {
  final Product product;
  DecreaseQty(this.product);
}

class ClearCart extends CartEvent {}