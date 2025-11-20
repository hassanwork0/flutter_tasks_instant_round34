import 'package:flutter/material.dart';

class CircularNextButton extends StatelessWidget {
  final double progress;
  final VoidCallback onPressed;
  
  const CircularNextButton({
    super.key,
    required this.progress,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 70,height: 70,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            color: Colors.green,
            value: progress,
            ),
        ),
        ElevatedButton(
          onPressed: onPressed, 
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: const EdgeInsets.all(18),
          ),
          child: const Icon(Icons.arrow_forward, 
          color: Colors.green, size: 30))],
    );
  }
}
