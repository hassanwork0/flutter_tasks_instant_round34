import 'package:flutter/material.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/routes/route_name.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedIndex = 1; // Explore tab index

  // الفئات مع الأيقونات
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Fresh Fruits\n& Vegetable',
      'icon': Icons.apple,
      'color': const Color(0xFF53B175),
    },
    {
      'name': 'Cooking Oil\n& Ghee',
      'icon': Icons.local_dining,
      'color': const Color(0xFFF8A44C),
    },
    {
      'name': 'Meat & Fish',
      'icon': Icons.set_meal,
      'color': const Color(0xFFF7A593),
    },
    {
      'name': 'Bakery & Snacks',
      'icon': Icons.bakery_dining,
      'color': const Color(0xFFD3B0E0),
    },
    {
      'name': 'Dairy & Eggs',
      'icon': Icons.egg,
      'color': const Color(0xFFFDE598),
    },
    {
      'name': 'Beverages',
      'icon': Icons.local_drink,
      'color': const Color(0xFFB7DFF5),
    },
  ];

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
        // Already on Explore screen
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Find Products",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //  Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  hintText: "Search Store",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Categories Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.85,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _buildCategoryCard(category);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: category['color'],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  category['icon'],
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // النص
            Text(
              category['name'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}