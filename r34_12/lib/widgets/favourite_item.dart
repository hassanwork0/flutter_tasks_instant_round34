import 'package:flutter/material.dart';
import '../../entity/product.dart';

class FavouriteItemWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const FavouriteItemWidget({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        children: [
          // صورة المنتج
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF53B175),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.local_drink, // أو أي أيقونة حسب المنتج
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 15),

          // الاسم + الوصف
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // السعر + زر Add
          Column(
            children: [
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                color: Colors.green,
                onPressed: onAddToCart,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
