import 'package:flutter/material.dart';

class NameBanner extends StatelessWidget {
  final String bannerTitle;
  const NameBanner({
    super.key,
    required this.bannerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          bannerTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'See All',
            style: TextStyle(
              fontSize: 16,
              color: Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}