import 'package:flutter/material.dart';
import 'package:r34_24/divider.dart';

class ProductDetailsPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final String details;
  final String minidetails;

  const ProductDetailsPage({
    super.key,
    this.imagePath = '',
    this.title = '',
    this.price = '',
    this.details = '',
    this.minidetails = '',
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 236, 228, 228),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
              child: Image.asset(
                widget.imagePath,
                width: double.infinity,
                height: 300,

              ),
            
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.minidetails,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                  icon: const Icon(
                    Icons.remove_circle,
                    color: Color.fromARGB(255, 39, 145, 94),
                    size: 36,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(
                    Icons.add_circle_rounded,
                    color: Color.fromARGB(255, 39, 145, 94),
                    size: 36,
                  ),
                ),
                const Spacer(),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 1, 1),
                  ),
                ),
              ],
            ),
          ),
          divider(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                   const Text(
                      'Product Details',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    widget.details,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
             divider(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                    'Nutrition',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                   ),
                   
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(
                          '100g',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                     ),

                   ),
                
                 
                 ),
               ],
             ),
             divider(),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                    'Reviews',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                   ),
                   
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 40),
                      Icon(Icons.star, color: Colors.amber, size: 40),
                      Icon(Icons.star, color: Colors.amber, size: 40),
                      Icon(Icons.star, color: Colors.amber, size: 40),
                      Icon(Icons.star_half, color: Colors.amber, size: 40),
                    ]
                    ),
                  ),
        ],
      ),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 22, 84, 54),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Add to Basket',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      )
        ],
      )
    );
  }
}
