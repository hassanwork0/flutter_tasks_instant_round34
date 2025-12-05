import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int qty;
  final IconData icon;
  final Color color;

  CartItem({
    required this.name,
    required this.price,
    required this.qty,
    required this.icon,
    required this.color,
  });
}
