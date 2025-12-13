import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/favourite/favourite_event.dart';
import '../widgets/bottom_nav_bar.dart';
import '../core/routes/route_name.dart';
import '../bloc/cart/cart_bloc.dart';
import '../bloc/cart/cart_event.dart';
import '../bloc/favourite/favourite_bloc.dart';
import '../bloc/favourite/favourite_state.dart';
import '../entity/product.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key, required List favouriteProducts});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 3;

    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, RouteName.home);
          break;
        case 1:
          Navigator.pushNamed(context, RouteName.explore);
          break;
        case 2:
          Navigator.pushNamed(context, RouteName.cart);
          break;
        case 3:
          break;
        case 4:
          Navigator.pushNamed(context, RouteName.account);
          break;
      }
    }

    return BlocBuilder<FavouriteBloc, FavouriteState>(
      builder: (context, state) {
        print('FavouriteScreen State: $state');
        
        List<Product> favouriteProducts = [];
        
        if (state is FavouriteLoaded) {
          favouriteProducts = state.favourites;
          print('Favourite products count: ${favouriteProducts.length}');
          
          // طباعة تفاصيل المنتجات للتأكد
          for (var product in favouriteProducts) {
            print('Favourite Product: ${product.title} (ID: ${product.id})');
          }
        }

        return Scaffold(
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Favourite",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              if (favouriteProducts.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      "${favouriteProducts.length} items",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          body: favouriteProducts.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "No favourites yet",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Tap the heart icon to add items",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: favouriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favouriteProducts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: product.image.startsWith("http")
                                  ? DecorationImage(
                                      image: NetworkImage(product.image),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              color: product.image.startsWith("http")
                                  ? null
                                  : Colors.grey[200],
                            ),
                            child: product.image.startsWith("http")
                                ? null
                                : const Icon(Icons.shopping_bag, color: Colors.grey),
                          ),
                          title: Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF53B175),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Color(0xFF53B175),
                                ),
                                onPressed: () {
                                  context.read<CartBloc>().add(AddToCart(product));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('${product.title} added to cart'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  context
                                      .read<FavouriteBloc>()
                                      .add(RemoveFavourite(product));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "${product.title} removed from favourites"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}