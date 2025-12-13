import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/home/home_bloc.dart';
import 'package:market_app/bloc/home/home_event.dart';
import 'package:market_app/bloc/home/home_state.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/core/routes/route_name.dart';
import 'package:market_app/widgets/product_card.dart';
import 'package:market_app/widgets/section_header.dart';
import 'package:market_app/source/data.dart';
import '../entity/product.dart';
import 'product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.45;

    return BlocProvider(
      create: (_) => HomeBloc(Data())..add(LoadHomeProducts()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is HomeError && _searchController.text.isEmpty) {
            return Scaffold(
              body: Center(child: Text(state.message)),
            );
          }

          if (state is HomeLoaded || state is HomeError) {
            // إذا فيه منتجات Loaded
            List<Product> offers = [];
            List<Product> bestSelling = [];
            String? errorMessage;

            if (state is HomeLoaded) {
              offers = state.offers;
              bestSelling = state.bestSelling;
            } else if (state is HomeError) {
              errorMessage = state.message;
            }

            // فلترة السيرش
            final query = _searchController.text;
            List<Product> displayedProducts = [];
            if (query.isNotEmpty && state is HomeLoaded) {
              displayedProducts = [...offers, ...bestSelling]
                  .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
                  .toList();
            }

            return Scaffold(
              bottomNavigationBar: CustomBottomNavBar(
                currentIndex: 0,
                onTap: (index) => _onItemTapped(index, context),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logo.png", height: 50),
                      const SizedBox(height: 20),

                      // Search Field
                      TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF2F3F2),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                          hintText: "Search Store",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        onChanged: (value) {
                          if (value.isEmpty) {
                            context.read<HomeBloc>().add(LoadHomeProducts());
                          } else {
                            context.read<HomeBloc>().add(SearchProducts(value));
                          }
                        },
                      ),

                      const SizedBox(height: 20),

                      // Banner
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/banner.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      if (query.isNotEmpty)
                        displayedProducts.isEmpty
                            ? const Center(child: Text("No products found"))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SectionHeader(title: "Search Results"),
                                  _buildHorizontalCardList(displayedProducts, cardWidth),
                                ],
                              )
                      else ...[
                        const SectionHeader(title: "Exclusive Offer"),
                        _buildHorizontalCardList(offers, cardWidth),
                        const SizedBox(height: 25),
                        const SectionHeader(title: "Best Selling"),
                        _buildHorizontalCardList(bestSelling, cardWidth),
                      ],

                      if (state is HomeError && query.isEmpty)
                        Center(child: Text(errorMessage ?? "Error")),
                    ],
                  ),
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 1:
        Navigator.pushNamed(context, RouteName.explore);
        break;
      case 2:
        Navigator.pushNamed(context, RouteName.cart);
        break;
      case 3:
        Navigator.pushNamed(context, RouteName.favorite);
        break;
      case 4:
        Navigator.pushNamed(context, RouteName.account);
        break;
    }
  }

  Widget _buildHorizontalCardList(List<Product> products, double cardWidth) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(product: product),
                ),
              );
            },
            child: ProductCard(product: product, width: cardWidth),
          );
        },
      ),
    );
  }
}
