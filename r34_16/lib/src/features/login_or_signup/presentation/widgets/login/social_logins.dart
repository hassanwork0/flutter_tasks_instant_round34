import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0), // * padding from screen edges
      child: Row(
        children: [
          // Google Button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
              label: const Text(
                "Google",
                style: TextStyle(color: Colors.red),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.red, width: 2),
                ),
                elevation: 2,
              ),
            ),
          ),
          const SizedBox(width: 12), 
          // Apple Button
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.black),
              label: const Text(
                "Apple",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                elevation: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
