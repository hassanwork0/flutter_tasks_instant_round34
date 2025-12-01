import 'package:animations/animations.dart';
import 'package:r34_16/src/core/constants/constants.dart';
import 'package:r34_16/src/features/entrypoint/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class EntryPointUi extends StatefulWidget {
  const EntryPointUi({super.key});

  @override
  State<EntryPointUi> createState() => _EntryPointUiState();
}

class _EntryPointUiState extends State<EntryPointUi> {
  int currentIndex = 0;

  void onBottomNavigationTap(int index) {
    currentIndex = index;
    setState(() {});
  }

  List<Widget> pages = [
    const HomePage(), // 0
    const SizedBox(), // 1 -> Menu placeholder
    const SizedBox(), // 2 -> placeholder for FAB
    const SizedBox(), // 3 -> Saved placeholder
    const SizedBox(), // 4 -> Profile placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: AppDefaults.duration,
        transitionBuilder: (child, primary, secondary) {
          return SharedAxisTransition(
            animation: primary,
            secondaryAnimation: secondary,
            transitionType: SharedAxisTransitionType.horizontal,
            fillColor: AppColor.scaffoldBackground,
            child: child,
          );
        },
        child: pages[currentIndex],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (_) => const CartPage(isHomePage: true)),
          // );
        },
        backgroundColor: Colors.grey[200],
        child: const Icon(Icons.shopping_cart, color: Colors.green),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            if (index != 0) {
              // Only Home does navigation
              return;
            }
            currentIndex = index;
          });
        },

        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 12),

        backgroundColor: Colors.white,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(icon: SizedBox(width: 48), label: " "),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
