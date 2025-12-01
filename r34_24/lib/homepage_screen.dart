import 'package:flutter/material.dart';
import 'package:r34_24/widgets/name_banner.dart';
import 'package:r34_24/widgets/product_card.dart';
import 'package:r34_24/product_details_page.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // LOGO
                Image.asset('assets/images/logo.png', height: 40),

                const SizedBox(height: 10),

                // LOCATION
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.grey, size: 25),
                    SizedBox(width: 8),
                    Text(
                      'Giza, Egypt',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // SEARCH BAR
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Store',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                  height: 150,
                  width: double.infinity,
                ),

                const SizedBox(height: 30),

                // Exclusive Offers Header
                NameBanner(
                  bannerTitle: 'Exclusive Offers',
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:  [
                      ProductCard(
                        imagePath: 'assets/images/apple.png',
                        title: 'Fresh Apples',
                        newprice: '\$4.99 ',
                        details: '70g',
                        price: '\$5.99', 
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsPage(
                                imagePath: 'assets/images/apple.png',
                                title: 'Fresh Apples',
                                details: 'Crisp, juicy, and perfect for snacking. Rich in fiber and antioxidants.',
                                price: '\$5.99',
                                minidetails: '1Kg , Price',
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        imagePath: 'assets/images/banana.png',
                        title: 'Organic Bananas',
                        newprice: '\$4.99',
                        details: '70g',
                        price: '\$5.99',
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsPage(
                                imagePath: 'assets/images/banana.png',
                                title: 'Organic Bananas',
                                details: 'Sweet and creamy bananas, perfect for smoothies and snacks. High in potassium and vitamins.',
                                price: '\$5.99',
                                minidetails: '1Kg , Price',
                              ),
                            ),
                          );
                        }, 
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        imagePath: 'assets/images/ginger.png',
                        title: 'Fresh Ginger',
                        newprice: '\$3.99 ',
                        details: '70g',
                        price: '\$5.99',
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsPage(
                                imagePath: 'assets/images/ginger.png',
                                title: 'Fresh Ginger',
                                details: 'Aromatic and spicy ginger root, perfect for cooking and teas. Known for its anti-inflammatory properties.',
                                price: '\$5.99',
                                minidetails: '100g , Price',
                              ),
                            ),
                          );
                        }, 
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        imagePath: 'assets/images/spices.png',
                        title: 'Mix of Spices Pack',
                        newprice: '\$6.99 ',
                        details: ' 70g',
                        price: '\$5.99', 
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsPage(
                                imagePath: 'assets/images/spices.png',
                                title: 'Mix of Spices Pack',
                                details: 'A flavorful blend of spices to enhance your dishes. Perfect for grilling, roasting, and seasoning.',
                                price: '\$5.99',
                                minidetails: '150g , Price',
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                NameBanner(
                  bannerTitle: 'Best Selling',
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:  [
                      ProductCard(
                        imagePath: 'assets/images/rice.png',
                        title: 'Rice',
                        details: '70g',
                        price: '\$5.99', 
                        onTap: () {
                          Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsPage(
                                imagePath: 'assets/images/rice.png',
                                title: 'Rice',
                                details: 'Long-grain white rice, perfect for a variety of dishes. Fluffy texture and mild flavor.',
                                price: '\$5.99',
                                minidetails: '1Kg , Price',
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        imagePath: 'assets/images/cucumber.png',
                        title: 'Cucumber',
                        newprice: '\$1.99 ',
                        details: '70g',
                        price: '\$5.99', 
                        onTap: () {},
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        imagePath: 'assets/images/broccoli.png',
                        title: 'Broccoli',
                        newprice: '\$3.49 ',
                        details: '70g',
                        price: '\$5.99', 
                        onTap: () {},
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        imagePath: 'assets/images/lettuce.png',
                        title: 'Lettuce',
                        newprice: '\$2.49 ',
                        details: ' 70g',
                        price: '\$5.99', 
                        onTap: () {},
                      ),
                      SizedBox(width: 20),
                    ],
                  )
                ),
                
                
              ],
              
            ),

          ),
        ),
      ),

      // BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
