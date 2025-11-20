// import 'package:flutter/material.dart';
// import 'package:grocery_app/entities/product_entity.dart';

// class ProductDetailsPage extends StatelessWidget {
//   final Product product;

//   const ProductDetailsPage({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(backgroundColor: const Color.fromARGB(255, 115, 198, 117)),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 height: 340,
//                 width: 345,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.green),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Image.asset(product.image, fit: BoxFit.fitHeight),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Text(
//                 product.title,
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     product.subtitle,
//                     style: TextStyle(fontSize: 15, color: Colors.grey),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       //add the product to save page
//                     },
//                     icon: Icon(Icons.favorite_border_outlined, size: 26),
//                   ),
//                 ],
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           //decrement the product
//                         },
//                         icon: Icon(Icons.minimize, color: Colors.green),
//                       ),
//                       SizedBox(
//                         width: 29,
//                         height: 29,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(color: Colors.green),
//                           ),
//                           child: Center(
//                             child: Text(
//                               "1",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           //increment the product
//                         },
//                         icon: Icon(Icons.add, color: Colors.green),
//                       ),
//                     ],
//                   ),
//                   Text(
//                     product.price,
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(color: Colors.grey, thickness: 0.54),
//           ],
//         ),
//       ),
//     );
//   }
// }
