import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined), 
          label: "Shop"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined), 
          label: "Explore"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined), 
          label: "Cart"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border), 
          label: "Favorite"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), 
          label: "Account"
        ),
      ],
    );
  }
}