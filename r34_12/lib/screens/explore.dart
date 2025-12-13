import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/home/home_bloc.dart';
import 'package:market_app/bloc/home/home_event.dart';
import 'package:market_app/bloc/home/home_state.dart';
import 'package:market_app/bloc/favourite/favourite_bloc.dart';
import 'package:market_app/bloc/cart/cart_bloc.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/widgets/product_card.dart';
import 'package:market_app/core/routes/route_name.dart';
import 'package:market_app/source/data.dart';
import 'package:market_app/entity/product.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 1;
  String searchQuery = "";
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        Navigator.pushNamed(context, RouteName.home);
        break;
      case 1:
        break; // نحن في Explore
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: BlocProvider.of<FavouriteBloc>(context)),
          BlocProvider.value(value: BlocProvider.of<CartBloc>(context)),
        ],
        child: BlocProvider(
          create: (_) => HomeBloc(Data())..add(LoadHomeProducts()),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HomeError) {
                return Center(child: Text(state.message));
              }
              if (state is HomeLoaded) {
                final allProducts = state.offers + state.bestSelling;

                final filteredProducts = searchQuery.isEmpty
                    ? allProducts
                    : allProducts
                        .where((p) => p.title
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();

                // تجميع حسب الفئة
                final Map<String, List<Product>> categorizedProducts = {};
                for (var product in filteredProducts) {
                  categorizedProducts
                      .putIfAbsent(product.category, () => [])
                      .add(product);
                }

                final categories = categorizedProducts.keys.toList();

                return SafeArea(
                  child: CustomScrollView(
                    slivers: [
                      // رأس الصفحة + البحث
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              const Text(
                                "Explore Products",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: _searchController,
                                onChanged: (text) {
                                  setState(() => searchQuery = text);
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: "Search product...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),

                      // الأقسام حسب الكاتيجوري
                      for (var category in categories)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 260,
                                  width: double.infinity,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    itemCount: categorizedProducts[category]!.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 16),
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        width: screenWidth * 0.6, // كل Card تاخد 60% من عرض الشاشة
                                        child: ProductCard(
                                          product:
 categorizedProducts[category]![index],
 width: screenWidth * 0.6,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      const SliverToBoxAdapter(child: SizedBox(height: 40)),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
