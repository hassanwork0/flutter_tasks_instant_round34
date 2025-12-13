import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entity/product.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<IncreaseQty>(_onIncreaseQty);
    on<DecreaseQty>(_onDecreaseQty);
    
    on<ClearCart>(_onClearCart);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final currentItems = List<Product>.from(state.products);
    
    // تحقق إذا المنتج موجود بالفعل
    final existingIndex = currentItems.indexWhere((p) => p.id == event.product.id);
    
    if (existingIndex != -1) {
      // إذا المنتج موجود، زيدي الكمية
      final existingProduct = currentItems[existingIndex];
      final updatedProduct = Product(
        id: existingProduct.id,
        title: existingProduct.title,
        description: existingProduct.description,
        category: existingProduct.category,
        price: existingProduct.price,
        image: existingProduct.image,
        sold: existingProduct.sold,
        views: existingProduct.views,
        qty: existingProduct.qty + 1,
      );
      currentItems[existingIndex] = updatedProduct;
    } else {
      // إذا المنتج جديد، أضيفيه بالكمية 1
      final newProduct = Product(
        id: event.product.id,
        title: event.product.title,
        description: event.product.description,
        category: event.product.category,
        price: event.product.price,
        image: event.product.image,
        sold: event.product.sold,
        views: event.product.views,
        qty: 1,
      );
      currentItems.add(newProduct);
    }
    
    emit(CartUpdated(currentItems));
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final currentItems = List<Product>.from(state.products);
    currentItems.removeWhere((p) => p.id == event.product.id);
    emit(CartUpdated(currentItems));
  }

  void _onIncreaseQty(IncreaseQty event, Emitter<CartState> emit) {
    final currentItems = List<Product>.from(state.products);
    final index = currentItems.indexWhere((p) => p.id == event.product.id);

    if (index != -1) {
      final existingProduct = currentItems[index];
      final updatedProduct = Product(
        id: existingProduct.id,
        title: existingProduct.title,
        description: existingProduct.description,
        category: existingProduct.category,
        price: existingProduct.price,
        image: existingProduct.image,
        sold: existingProduct.sold,
        views: existingProduct.views,
        qty: existingProduct.qty + 1,
      );
      currentItems[index] = updatedProduct;
      emit(CartUpdated(currentItems));
    }
  }

  void _onDecreaseQty(DecreaseQty event, Emitter<CartState> emit) {
    final currentItems = List<Product>.from(state.products);
    final index = currentItems.indexWhere((p) => p.id == event.product.id);

    if (index != -1) {
      final existingProduct = currentItems[index];
      if (existingProduct.qty > 1) {
        final updatedProduct = Product(
          id: existingProduct.id,
          title: existingProduct.title,
          description: existingProduct.description,
          category: existingProduct.category,
          price: existingProduct.price,
          image: existingProduct.image,
          sold: existingProduct.sold,
          views: existingProduct.views,
          qty: existingProduct.qty - 1,
        );
        currentItems[index] = updatedProduct;
      } else {
        // إذا الكمية 1، أزيلي المنتج
        currentItems.removeAt(index);
      }
      emit(CartUpdated(currentItems));
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartUpdated([]));
  }
}