import 'package:flutter/material.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/source/data.dart';
import 'package:market_app/routes/route_name.dart';

import '../entity/product.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
import '../screens/product_details_page.dart';

class HomePage extends StatefulWidget { 
  const HomePage({super.key});
   
  @override 
  State<HomePage> createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final Data data = Data();
  List<Product> offers = [];
  List<Product> bestSelling = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    List<Product> products = await data.getAllProducts();
    setState(() {
      offers = products.take(3).toList();
      bestSelling = products.length > 3 ? products.sublist(3, products.length) : [];
    });
  }

  void _onItemTapped(int index) {
  print(' Tab pressed: $index');
  print('Current index: $_selectedIndex');
  
  setState(() {
    _selectedIndex = index;
  });

  switch (index) {
    case 0:
      print(' Already on Home');
      break;
    case 1:
      print(' Navigating to Explore');
      Navigator.pushNamed(context, RouteName.explore);
      break;
    case 2:
      print(' Navigating to Cart');
      Navigator.pushNamed(context, RouteName.cart);
      break;
    case 3:
      print(' Navigating to Favorite');
      Navigator.pushNamed(context, RouteName.favorite);
      break;
    case 4:
      print(' Navigating to Account');
      Navigator.pushNamed(context, RouteName.account);
      break;
  }
}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.45;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png", height: 50, fit: BoxFit.contain),
                const SizedBox(height: 20),

                //  Search bar
                const TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF2F3F2),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    hintText: "Search Store",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),

                const SizedBox(height: 20),

                //  Banner
                Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                //  Offers Section
                const SectionHeader(title: "Exclusive Offer"),
                _buildHorizontalCardList(offers, cardWidth),

                const SizedBox(height: 25),

                //  Best Selling Section
                const SectionHeader(title: "Best Selling"),
                _buildHorizontalCardList(bestSelling, cardWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalCardList(List<Product> products, double cardWidth) {
    return SizedBox(
      height: 250,
      child: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: EdgeInsets.only(right: index == products.length - 1 ? 0 : 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: ProductCard(product: product, width: cardWidth),
                  ),
                );
              },
            ),
    );
  }
}