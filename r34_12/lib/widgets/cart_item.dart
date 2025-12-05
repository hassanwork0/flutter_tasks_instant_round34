import 'package:flutter/material.dart';
import '../model/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // الأيقونة
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: item.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            item.icon,
            color: item.color,
            size: 30,
          ),
        ),

        const SizedBox(width: 15),

        // معلومات المنتج
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$${item.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),

        // عداد الكمية
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, size: 18),
                onPressed: onDecrease,
              ),
              Text(
                item.qty.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.add, size: 18),
                onPressed: onIncrease,
              ),
            ],
          ),
        ),

        const SizedBox(width: 10),

        // زر الحذف
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: onRemove,
        ),
      ],
    );
  }
}