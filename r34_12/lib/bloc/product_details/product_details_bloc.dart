import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState(quantity: 1)) {
    on<IncrementQuantity>((event, emit) {
      emit(state.copyWith(quantity: state.quantity + 1));
    });

    on<DecrementQuantity>((event, emit) {
      if (state.quantity > 1) {
        emit(state.copyWith(quantity: state.quantity - 1));
      }
    });
  }
}
