import 'package:flutter/material.dart';

class NameStyle extends StatelessWidget {
  final double fontSize;

  const NameStyle({
    super.key,
    required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      "GrocerEase",
      style: TextStyle(
        letterSpacing: 2.5,
        fontFamily: "Lilita One",
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: Color(0xff44745E),
      ),
    );
  }
}
