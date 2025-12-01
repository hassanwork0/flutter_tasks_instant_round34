import 'package:flutter/material.dart';

class OurNewItemDetails extends StatefulWidget {
  final Map<String, String> item;
  const OurNewItemDetails({super.key, required this.item});

  @override
  State<OurNewItemDetails> createState() => _OurNewItemDetailsState();
}

class _OurNewItemDetailsState extends State<OurNewItemDetails> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Replace with actual images
  final List<String> _imageAssets = [
    'assets/images/item1.png',
    'assets/images/item2.png',
    'assets/images/item3.png',
  ];

  bool _isFavorite = false;
  int _quantity = 1;

  final List<Map<String, String>> _itemDetails = [
    {'name': 'Item A', 'weight': '1 Kg'},
    {'name': 'Item B', 'weight': '500 g'},
    {'name': 'Item C', 'weight': '2 Kg'},
  ];

  void _toggleFavorite() => setState(() => _isFavorite = !_isFavorite);
  void _incrementQuantity() => setState(() => _quantity++);
  void _decrementQuantity() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onReviewTap() => print('Review tapped');
  void _onBuyNowTap() => print('Buy Now tapped');
  void _onCartTap() => print('Cart tapped');

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.item['title'] ?? 'Item Details',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Slider with Heart Icon
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) => setState(() => _currentPage = index),
                      children: _imageAssets.map((path) {
                        return Image.asset(path,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                                  color: Colors.grey,
                                  child: const Center(child: Text('Image')),
                                ));
                      }).toList(),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)],
                      ),
                      child: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imageAssets.length, (i) {
                return GestureDetector(
                  onTap: () => _goToPage(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: _currentPage == i ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == i ? Colors.green : Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            // Title
            Text(widget.item['title'] ?? 'Item Title',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            const SizedBox(height: 16),

            // Price + Quantity
            Row(
              children: [
                Text(widget.item['price'] ?? '\$0',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Text('\$100',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough, color: Colors.grey)),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _decrementQuantity,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[200], borderRadius: BorderRadius.circular(6)),
                          child: const Icon(Icons.remove, size: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('$_quantity',
                          style:
                              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    GestureDetector(
                      onTap: _incrementQuantity,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[200], borderRadius: BorderRadius.circular(6)),
                          child: const Icon(Icons.add, size: 18)),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Weight, Size, Items
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('${_quantity * 2} Kg',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Weight', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
                Column(
                  children: [
                    const Text('Medium',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Size', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
                Column(
                  children: [
                    Text('$_quantity',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('Items', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Item Details
            const Text('Item Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Column(
              children: _itemDetails.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.green[100], borderRadius: BorderRadius.circular(8)),
                          child: const Icon(Icons.eco, color: Colors.green)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.w500))),
                      Text(item['weight']!, style: const TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // Review
            GestureDetector(
              onTap: _onReviewTap,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration:
                    BoxDecoration(color: Colors.grey[50], borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    const Text('Review', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Row(children: List.generate(5, (_) => const Icon(Icons.star, color: Colors.amber, size: 20))),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Cart + Buy Now
            Row(
              children: [
                GestureDetector(
                  onTap: _onCartTap,
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.shopping_cart, color: Colors.black)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: _onBuyNowTap,
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text('Buy Now',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
