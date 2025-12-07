import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginMethodPage extends StatelessWidget {
  const LoginMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // * ensures keyboard does not break layout
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // * makes page scrollable with keyboard
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                // Logo
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
                // Welcome Text
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
                SizedBox(height: 30),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RoutesName.login),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16), // *
                    ),
                    child: const Text(
                      'Login with Phone',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // OR Text
                const Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                // Social login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Apple
                    _SocialButton(
                      icon: FontAwesomeIcons.apple,
                      color: Colors.black,
                      borderColor: Colors.black,
                      onTap: () {}, // *
                    ),
                    // Google
                    _SocialButton(
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                      borderColor: Colors.red,
                      onTap: () {}, // *
                    ),
                    // Facebook
                    _SocialButton(
                      icon: FontAwesomeIcons.facebookF,
                      color: Colors.blue,
                      borderColor: Colors.blue,
                      onTap: () {}, // *
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget { // * helper widget for social buttons
  const _SocialButton({
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.onTap,
  });

  final IconData icon;
  final Color color, borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: 2),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), // *
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, size: 30, color: color),
      ),
    );
  }
}
