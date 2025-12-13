class ProductDetailsState {
  final int quantity;

  ProductDetailsState({required this.quantity});

  ProductDetailsState copyWith({int? quantity}) {
    return ProductDetailsState(
      quantity: quantity ?? this.quantity,
    );
  }
}
