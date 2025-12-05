import 'package:flutter/material.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/routes/route_name.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, RouteName.home);
        break;
      case 1:
        Navigator.pushNamed(context, RouteName.explore);
        break;
      case 2:
        Navigator.pushNamed(context, RouteName.cart);
        break;
      case 3:
        Navigator.pushNamed(context, RouteName.favorite);
        break;
      case 4:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      
      appBar: AppBar(
        title: Text("Account"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // User info
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[100],
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xFF53B175),
                  radius: 30,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Afsar Hossen",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "imshuvc97@gmail.com",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Orders section
          Text(
            "Orders",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          // كل item لوحده
          Card(
            child: ListTile(
              leading: Icon(Icons.person_outline, color: Color(0xFF53B175)),
              title: Text("My Details"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.location_on_outlined, color: Color(0xFF53B175)),
              title: Text("Delivery Address"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.payment_outlined, color: Color(0xFF53B175)),
              title: Text("Payment Methods"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.local_offer_outlined, color: Color(0xFF53B175)),
              title: Text("Promo Cord"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_outlined, color: Color(0xFF53B175)),
              title: Text("Notifications"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.help_outline, color: Color(0xFF53B175)),
              title: Text("Help"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),

          SizedBox(height: 30),

          // About section  
          Text(
            "About",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          Card(
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Log Out", style: TextStyle(color: Colors.red)),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}