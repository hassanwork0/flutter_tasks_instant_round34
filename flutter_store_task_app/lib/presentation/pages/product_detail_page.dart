// presentation/pages/product_detail_page.dart
import 'package:flutter/material.dart';

class ProductDetailPage {
  // extends StatelessWidget {
  //final String productId;

  //const ProductDetailPage({Key? key, required this.productId}) : super(key: key);

  //   @override
  //   Widget build(BuildContext context) {
  //     // 1. Provide the BLoC and trigger the initial event
  //     return BlocProvider(
  //       create: (context) => ProductDetailBloc(
  //         getProductDetail: GetIt.I<GetProductDetailUseCase>(), // GetIt for DI
  //       )..add(FetchProductDetail(productId: productId)),
  //       child: Scaffold(
  //         // ... UI structure
  //         body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
  //           builder: (context, state) {
  //             if (state is ProductDetailLoading) {
  //               return const Center(child: CircularProgressIndicator());
  //             } else if (state is ProductDetailLoaded) {
  //               final product = state.product;
  //               // 2. Build the UI using 'product' data
  //               return Column(
  //                 children: [
  //                   // Image
  //                   // Product Title: 'Naturel Red Apple'
  //                   Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  //                   // Price: '$4.99'
  //                   Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
  //                   // 'Add to Basket' Button                   ElevatedButton(
  //                     onPressed: () { /* Add to basket logic */ },
  //                     child: const Text('Add To Basket'),
  //                   ),
  //                 ],
  //               );
  //             } else if (state is ProductDetailError) {
  //               return Center(child: Text('Error: ${state.message}'));
  //             }
  //             return Container();
  //           },
  //         ),
  //       ),
  //     );
  //   }
}
