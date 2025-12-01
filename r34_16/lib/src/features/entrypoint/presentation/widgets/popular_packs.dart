import 'package:flutter/material.dart';

class PopularPacks extends StatelessWidget {
  const PopularPacks({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> packs = [
      {'title': 'Family Pack', 'subtitle': 'Rice, Sugar, Pasta', 'price': '\$45'},
      {'title': 'Snack Pack', 'subtitle': 'Chips, Soda, Cookies', 'price': '\$15'},
      {'title': 'BBQ Pack', 'subtitle': 'Meat, Spices, Sauce', 'price': '\$60'},
      {'title': 'Healthy Pack', 'subtitle': 'Oats, Honey, Yogurt', 'price': '\$30'},
      {'title': 'Party Pack', 'subtitle': 'Juice, Pizza, Ice Cream', 'price': '\$80'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Packs',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: packs.length,
              itemBuilder: (context, index) {
                final pack = packs[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {},  
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 140,
                        color: Colors.grey,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pack['title']!, 
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              pack['subtitle']!, 
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  pack['price']!, 
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '\$100', 
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
