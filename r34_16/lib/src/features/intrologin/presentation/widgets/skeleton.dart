import 'package:r34_16/src/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width, this.layer = 1});

  final double? height, width;
  final int layer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04 * layer),
        borderRadius: const BorderRadius.all(Radius.circular(AppDefaults.radius)),
      ),
    );
  }
}


//it's like a goodlooking loadin