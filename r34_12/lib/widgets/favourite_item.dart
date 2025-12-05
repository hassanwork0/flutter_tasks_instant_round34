import 'package:flutter/material.dart';

class FavouriteItem extends StatelessWidget {
  
  final IconData icon;
  final String name;
  final String sub;
  final String price;

  const FavouriteItem({
    super.key,
    required this.icon,
    required this.name,
    required this.sub,
    required this.price,
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
              icon,
              color: const Color(0xFF53B175),
              size: 30,
            ),
          ),

          const SizedBox(width: 15),

          //الاسم+الوصف
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  sub,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // السعر + السهم
          Row(
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}