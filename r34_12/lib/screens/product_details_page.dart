import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/cart/cart_bloc.dart';
import 'package:market_app/bloc/cart/cart_event.dart';
import 'package:market_app/bloc/product_details/product_details_bloc.dart';
import 'package:market_app/bloc/product_details/product_details_event.dart';
import 'package:market_app/bloc/product_details/product_details_state.dart';
import '../entity/product.dart';


class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsBloc(),
      child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                product.title,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: product.image.startsWith("http")
                        ? Image.network(
                            product.image,
                            height: 200,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                          )
                        : Image.asset(
                            product.image,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  const SizedBox(height: 30),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<ProductDetailsBloc>().add(DecrementQuantity());
                        },
                        icon: const Icon(Icons.remove_circle, color: Colors.green, size: 35),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${state.quantity}',
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          context.read<ProductDetailsBloc>().add(IncrementQuantity());
                        },
                        icon: const Icon(Icons.add_circle, color: Colors.green, size: 35),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final productWithQuantity = Product(
                        id: product.id,
                        title: product.title,
                        description: product.description,
                        category: product.category,
                        price: product.price,
                        image: product.image,
                        sold: product.sold,
                        views: product.views,
                        qty: state.quantity,
                      );

                      // إضافة للكارت
                      context.read<CartBloc>().add(AddToCart(productWithQuantity));
                      
                      // رسالة تأكيد
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${product.title} added to cart'),
                        backgroundColor: Colors.green,)
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text("Add to Cart"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF53B175),
                    ),
                  ),
                ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
