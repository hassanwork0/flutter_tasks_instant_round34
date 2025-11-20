import 'package:flutter/material.dart';
import 'package:flutter_store_task_app/src/core/constants/colors.dart';

class SignInLandingScreen extends StatelessWidget {
  const SignInLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using a LayoutBuilder to handle responsiveness if needed
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image (Groceries)
            SizedBox(
              height: 380,
              width: double.infinity,
              child: Image.network(
                'https://img.freepik.com/free-photo/healthy-vegetables-full-paper-bag_23-2148043213.jpg', // Placeholder for top image
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Get your groceries\nwith nectar",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Phone Number Input Area
                  GestureDetector(
                    onTap: () {
                      // Navigate to the dedicated Number Entry Screen
                      Navigator.pushNamed(context, '/enter_number');
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFE2E2E2)),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Image.network(
                            "https://flagcdn.com/w40/bd.png",
                            width: 34,
                          ), // Bangladesh Flag
                          const SizedBox(width: 12),
                          const Text(
                            "+880",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // This is just a visual placeholder text, actual input is on next screen
                          const Expanded(
                            child: Text(
                              "", // Empty to mimic the placeholder look
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  const Center(
                    child: Text(
                      "Or connect with social media",
                      style: TextStyle(color: Color(0xFF828282), fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Google Button
                  _buildSocialButton(
                    color: const Color(0xFF5383EC),
                    text: "Continue with Google",
                    icon: Icons
                        .g_mobiledata, // Using built-in icon for simplicity
                    onPressed: () {
                      // Navigate to Email Login as per your previous request flow
                      Navigator.pushNamed(context, '/login');
                    },
                  ),

                  const SizedBox(height: 20),

                  // Facebook Button
                  _buildSocialButton(
                    color: const Color(0xFF4A66AC),
                    text: "Continue with Facebook",
                    icon: Icons.facebook,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Color color,
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(icon, color: Colors.white, size: 30),
            Expanded(
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30), // Balance the icon width
          ],
        ),
      ),
    );
  }
}
