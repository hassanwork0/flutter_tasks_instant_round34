import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/bloc/user/user_bloc.dart';
import 'package:market_app/bloc/user/user_event.dart';
import 'package:market_app/bloc/user/user_state.dart';
import 'package:market_app/widgets/bottom_nav_bar.dart';
import 'package:market_app/core/routes/route_name.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 4;

    void _onItemTapped(int index) {
      if (_selectedIndex == index) return;

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

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return _buildGuestView(context);
          }

          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xFF53B175)),
            );
          }

          if (state is UserError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 60, color: Colors.red),
                  SizedBox(height: 16),
                  Text(state.message, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<UserBloc>().add(LogoutUserEvent()),
                    child: Text('Back to Login'),
                  ),
                ],
              ),
            );
          }

          if (state is UserLoaded) {
            return _buildUserView(context, state.user);
          }

          return _buildGuestView(context);
        },
      ),
    );
  }

  Widget _buildGuestView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Color(0xFF53B175),
            child: Column(
              children: [
                SizedBox(height: 40),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Color(0xFF53B175)),
                ),
                SizedBox(height: 16),
                Text(
                  "Guest User",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Not logged in",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.login);
                  },
                  child: Text(
                    'Login to Your Account',
                    style: TextStyle(
                      color: Color(0xFF53B175),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _buildAccountSection('Quick Actions', Icons.bolt_outlined, [
                  _buildSettingTile(
                    Icons.login,
                    'Login',
                    () => Navigator.pushNamed(context, RouteName.login),
                  ),
                  _buildSettingTile(
                    Icons.person_add,
                    'Create Account',
                    () => Navigator.pushNamed(context, RouteName.signup),
                  ),
                ]),
                SizedBox(height: 24),
                _buildAccountSection('App Settings', Icons.settings_outlined, [
                  _buildSettingTile(Icons.notifications_outlined, 'Notifications', () {}),
                  _buildSettingTile(Icons.help_outline, 'Help & Support', () {}),
                  _buildSettingTile(Icons.info_outline, 'About', () {}),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserView(BuildContext context, user) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Color(0xFF53B175),
          child: Row(
            children: [
              user.profileImage != null && user.profileImage!.isNotEmpty
                  ? CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(user.profileImage!),
                      backgroundColor: Colors.white,
                    )
                  : CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 30, color: Color(0xFF53B175)),
                    ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      user.email,
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          color: Colors.green[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                Text('Joined', style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text('${user.joinDate.year}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ]),
              Column(children: [
                Text('Phone', style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(
                  user.phone.isNotEmpty ? user.phone : 'N/A',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ]),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _buildAccountSection('Personal Info', Icons.person_outline, [
                  _buildInfoRow('Name', user.name),
                  _buildInfoRow('Email', user.email),
                  _buildInfoRow('Phone', user.phone.isNotEmpty ? user.phone : 'Not set'),
                  _buildInfoRow('Address', user.address.isNotEmpty ? user.address : 'Not set'),
                ]),
                SizedBox(height: 20),
                _buildAccountSection('Account', Icons.settings_outlined, [
                  _buildSettingTile(Icons.edit_outlined, 'Edit Profile', () {}),
                  _buildSettingTile(Icons.notifications_outlined, 'Notifications', () {}),
                  _buildSettingTile(Icons.lock_outline, 'Security', () {}),
                ]),
                SizedBox(height: 20),
                _buildAccountSection('Orders', Icons.shopping_bag_outlined, [
                  _buildSettingTile(Icons.history, 'Order History', () {}),
                  _buildSettingTile(Icons.local_shipping_outlined, 'Track Order', () {}),
                ]),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => _showLogoutDialog(context),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              context.read<UserBloc>().add(LogoutUserEvent());
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.social,
                (route) => false,
              );
            },
            child: Text('Logout', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection(String title, IconData icon, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Icon(icon, color: Color(0xFF53B175)),
          SizedBox(width: 8),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ]),
        SizedBox(height: 12),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 15, color: Colors.grey)),
          Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF53B175)),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
