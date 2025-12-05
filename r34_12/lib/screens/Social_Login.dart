import 'package:flutter/material.dart';
import 'package:market_app/routes/route_name.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f6ff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image
            SizedBox(
              width: double.infinity,
              height: 350,
              child: Image.network(
                'https://www.shutterstock.com/image-photo/paper-bag-full-fruits-vegetables-260nw-2501795705.jpg',
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 30),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Get your groceries\nwith nectar",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Connect using social media",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            // Google Button
            _buildButton(
              text: "Google",
              color: Color(0xFF53B175),
              onTap: () {},
            ),

            const SizedBox(height: 15),

            // Facebook Button
            _buildButton(
              text: "Facebook",
              color: Color(0xFF53B175),
              onTap: () {},
            ),

            const SizedBox(height: 25),

            //Login Button
            _buildButton(
              text: "Account Login",
              color: Color(0xFF53B175),
              onTap: () {
                Navigator.pushNamed(context, RouteName.login);
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
