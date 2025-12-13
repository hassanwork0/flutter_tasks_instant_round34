class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String image;
  final int sold;
  final int views;
  int qty;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    required this.sold,
    required this.views,
    required this.qty,
  });
}