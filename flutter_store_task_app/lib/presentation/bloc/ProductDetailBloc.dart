// presentation/bloc/product_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
// ... imports for Events, States, and UseCase

// class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
//   final GetProductDetailUseCase getProductDetail;

//   ProductDetailBloc({required this.getProductDetail}) : super(ProductDetailInitial()) {
//     on<FetchProductDetail>((event, emit) async {
//       emit(ProductDetailLoading());
//       final result = await getProductDetail(event.productId);
//       result.fold(
//         (failure) => emit(ProductDetailError(message: failure.toString())),
//         (product) => emit(ProductDetailLoaded(product: product)),
//       );
//     });
//   }
// }
// State classes: ProductDetailInitial, ProductDetailLoading, 
// ProductDetailLoaded(ProductEntity product), ProductDetailError(String message)