import 'package:r34_16/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AdSpace extends StatelessWidget {
  const AdSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), 
        child: Image.asset(
          AppIcons.ad,
          width: double.infinity,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
