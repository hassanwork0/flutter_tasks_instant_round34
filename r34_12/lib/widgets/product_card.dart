import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../entity/product.dart';
import '../bloc/favourite/favourite_bloc.dart';
import '../bloc/favourite/favourite_event.dart';
import '../bloc/favourite/favourite_state.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../core/routes/route_name.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double width;

  const ProductCard({super.key, required this.product, required this.width});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteBloc, FavouriteState>(
      listener: (context, state) {
        // للتحقق من تغييرات الفافوريت
        if (state is FavouriteLoaded) {
          print('Favourites updated: ${state.favourites.length} items');
        }
      },
      child: Container(
        width: width,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Center(
                      child: product.image.startsWith("http")
                          ? Image.network(
                              product.image,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                child: Icon(Icons.broken_image,
                                    size: 50, color: Colors.grey),
                              ),
                            )
                          : Image.asset(
                              product.image,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                child: Icon(Icons.broken_image,
                                    size: 50, color: Colors.grey),
                              ),
                            ),
                    ),
                    // أيقونة الفافوريت - المعدلة
                    Positioned(
                      top: 0,
                      right: 0,
                      child: BlocBuilder<FavouriteBloc, FavouriteState>(
                        builder: (context, state) {
                          bool isFav = false;
                          if (state is FavouriteLoaded) {
                            // تحقق من وجود المنتج باستخدام ID
                            isFav = state.favourites.any((p) => p.id == product.id);
                            print('Product ${product.id} is favourite: $isFav');
                          }
                          
                          return GestureDetector(
                            onTap: () {
                              print('Tapping favourite for product: ${product.id}');
                              final favBloc = context.read<FavouriteBloc>();
                              
                              if (isFav) {
                                print('Removing from favourites');
                                favBloc.add(RemoveFavourite(product));
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${product.title} removed from favourites'),
                                    backgroundColor: Colors.red,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                print('Adding to favourites');
                                favBloc.add(AddFavourite(product));
                                
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${product.title} added to favourites'),
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                                
                                // اختياري: الانتقال لصفحة الفافوريت بعد إضافة المنتج
                                // Future.delayed(const Duration(seconds: 2), () {
                                //   Navigator.pushNamed(context, RouteName.favorite);
                                // });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                color: isFav ? Colors.red : Colors.grey,
                                size: 22,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product.description,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CartBloc>().add(AddToCart(product));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.title} added to cart'),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pushNamed(context, RouteName.cart);
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF53B175),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}