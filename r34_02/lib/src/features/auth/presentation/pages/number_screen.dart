import 'package:flutter/material.dart';
import 'package:flutter_store_task_app/src/core/constants/colors.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFC), // Slightly off-white background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Text(
              "Enter your mobile number",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Mobile Number",
              style: TextStyle(
                color: AppColors.textGrey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),

            // Phone Input Row
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              autofocus: true,
              style: const TextStyle(fontSize: 18, color: AppColors.textDark),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    top: 12,
                    bottom: 12,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        "https://flagcdn.com/w40/bd.png",
                        width: 30,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "+880",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.border),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {
          // In a real app, this would go to Verification Code screen
          // For now, we can route it to login or home
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
