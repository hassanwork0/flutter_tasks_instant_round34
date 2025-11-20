import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final String text;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.image,
    required this.text,
    required this.borderColor,
    required this.textColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           Image.asset(image ,width: 30,height: 30, ),
             SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
