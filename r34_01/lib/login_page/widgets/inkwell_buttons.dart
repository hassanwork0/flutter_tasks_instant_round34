import 'package:flutter/material.dart';

class InkwellButtons extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Color color;
  const InkwellButtons({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 70,
        width: 70,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),

          color: const Color.fromARGB(255, 245, 255, 244),
          shape: BoxShape.circle,
        ),
        child: Image.asset(image, height: height, width: width),
      ),
    );
  }
}
