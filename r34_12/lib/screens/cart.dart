import 'package:flutter/material.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/model/cart_model.dart';
import 'package:market_app/routes/route_name.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 2; // Cart tab index

  // بيانات المنتجات
  List<CartItem> cartItems = [
    CartItem(
      name: "Bell Pepper Red", 
      price: 4.99, 
      qty: 1, 
      icon: Icons.eco,
      color: Colors.red
    ),
    CartItem(
      name: "Egg Chicken Red", 
      price: 1.99, 
      qty: 1, 
      icon: Icons.egg,
      color: Colors.orange
    ),
    CartItem(
      name: "Organic Bananas", 
      price: 3.00, 
      qty: 1, 
      icon: Icons.agriculture,
      color: Colors.yellow
    ),
    CartItem(
      name: "Ginger", 
      price: 2.99, 
      qty: 1, 
      icon: Icons.grass,
      color: Colors.brown
    ),
  ];

  double get totalPrice {
    return cartItems.fold(
      0,
      (sum, item) => sum + item.price * item.qty,
    );
  }

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
        // Already on Cart screen
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
      // Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(15),
              itemCount: cartItems.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemWidget(
                  item: item,
                  onIncrease: () {
                    setState(() => item.qty++);
                  },
                  onDecrease: () {
                    if (item.qty > 1) setState(() => item.qty--);
                  },
                  onRemove: () {
                    setState(() => cartItems.removeAt(index));
                  },
                );
              },
            ),
          ),

          // زر Checkout
          Container(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: const Color(0xFF53B175),
                ),
                onPressed: () {},
                child: Text(
                  "Go to Checkout  \$${totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 17, 
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}