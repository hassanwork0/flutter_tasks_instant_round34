import 'package:flutter/material.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/routes/route_name.dart';
import 'package:market_app/widgets/favourite_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int _selectedIndex = 3; // Favourite tab index

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    
    setState(() {
      _selectedIndex = index;
    });

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
        // Already on Favourite screen
        break;
      case 4:
        Navigator.pushNamed(context, RouteName.account);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      // Bottom Navigation Bar
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
      ),

      // المحتوى
      body: Column(
        children: [
          // الـ List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              children: const [
                FavouriteItem(
                  icon: Icons.local_drink,
                  name: "Sprite Can",
                  sub: "325ml, Price",
                  price: "\$1.50",
                ),
                FavouriteItem(
                  icon: Icons.local_drink,
                  name: "Diet Coke",
                  sub: "355ml, Price",
                  price: "\$1.99",
                ),
                FavouriteItem(
                  icon: Icons.local_drink,
                  name: "Apple & Grape Juice",
                  sub: "2L, Price",
                  price: "\$15.50",
                ),
                FavouriteItem(
                  icon: Icons.local_drink,
                  name: "Coca Cola Can",
                  sub: "325ml, Price",
                  price: "\$4.99",
                ),
                FavouriteItem(
                  icon: Icons.local_drink,
                  name: "Pepsi Can",
                  sub: "330ml, Price",
                  price: "\$4.99",
                ),
              ],
            ),
          ),

          // زر Add All
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: SizedBox(
              height: 55,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF53B175),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Add All To Cart",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}