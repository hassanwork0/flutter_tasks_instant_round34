import 'package:r34_16/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.shopping_cart, size: 90, color: Colors.green),
          ),

          SizedBox(height: 40),

          // Welcome texts
          Text(
            'Welcome to our',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'E-Grocery',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColor.primary,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
