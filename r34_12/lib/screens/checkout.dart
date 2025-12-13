import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/cart/cart_bloc.dart';
import 'package:market_app/bloc/cart/cart_event.dart';
import 'package:market_app/bloc/cart/cart_state.dart';
import '../widgets/bottom_nav_bar.dart';
import '../core/routes/route_name.dart';

class SimpleCheckoutScreen extends StatefulWidget {
  const SimpleCheckoutScreen({super.key});

  @override
  State<SimpleCheckoutScreen> createState() => _SimpleCheckoutScreenState();
}

class _SimpleCheckoutScreenState extends State<SimpleCheckoutScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  int _selectedIndex = 2;
  String _paymentMethod = 'Cash on Delivery';

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamedAndRemoveUntil(context, RouteName.home, (route) => false);
        break;
      case 1:
        Navigator.pushNamedAndRemoveUntil(context, RouteName.explore, (route) => false);
        break;
      case 2:
        Navigator.popUntil(context, ModalRoute.withName(RouteName.cart));
        break;
      case 3:
        Navigator.pushNamedAndRemoveUntil(context, RouteName.favorite, (route) => false);
        break;
      case 4:
        Navigator.pushNamedAndRemoveUntil(context, RouteName.account, (route) => false);
        break;
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final cartItems = state.products;

          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text("Your cart is empty", style: TextStyle(fontSize: 18, color: Colors.grey)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, RouteName.home),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53B175),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text("Start Shopping", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          }

          final double subtotal = cartItems.fold(0.0, (sum, item) => sum + (item.price * item.qty));
          final double shipping = 5.99;
          final double tax = subtotal * 0.1;
          final double total = subtotal + shipping + tax;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Delivery Information", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: "Full Name", prefixIcon: Icon(Icons.person_outline), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Phone Number", prefixIcon: Icon(Icons.phone_outlined), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _addressController,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: "Delivery Address", prefixIcon: Icon(Icons.home_outlined), border: OutlineInputBorder()),
                ),
                const SizedBox(height: 24),
                const Text("Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                RadioListTile(
                  title: const Text("Cash on Delivery"),
                  value: "Cash on Delivery",
                  groupValue: _paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                  activeColor: const Color(0xFF53B175),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      _processOrder(context, cartItems, total);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF53B175),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text("Place Order - \$${total.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _processOrder(BuildContext context, List<dynamic> cartItems, double total) {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty || _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields"), backgroundColor: Colors.red),
      );
      return;
    }

    // عرض رسالة نجاح الطلب
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(Icons.check_circle, size: 60, color: Color(0xFF53B175)),
        content: const Text("Your order has been placed successfully!", textAlign: TextAlign.center),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              context.read<CartBloc>().add(ClearCart());
              Navigator.pushNamed(context, RouteName.home);
            },
            child: const Text("Continue Shopping"),
          ),
        ],
      ),
    );
  }
}
