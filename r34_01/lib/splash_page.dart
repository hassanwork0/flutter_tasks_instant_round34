import 'package:flutter/material.dart';
import 'package:r34_01/onboarding_page/onboarding_page.dart';
import 'package:r34_01/widgets/name_style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool showLoader = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 255, 244),
      body: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child:
                  Image.asset("assets/images/1.png")
              ),
             NameStyle(fontSize: 50.0,)
            ],
          ))     
      // body: Stack(
      //   children: [
      //     Positioned.fill(
      //       child: Image.asset("assets/images/logo.png", fit: BoxFit.cover ,
      //       ),
      //     ),
      //     Container(color: Colors.white.withOpacity(0.3),),
      //     Center(
      //       child: Padding(
      //         padding: const EdgeInsets.all(40),
      //         child: Column(
      //           children: [
      //             Stack(
      //               children: [
      //                 Text(
      //                   'GrocerEase',
      //                   style: TextStyle(
      //                     fontSize: 70,
      //                     color: const Color.fromARGB(255, 26, 112, 49),
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),

      //                 Text(
      //                   "GrocerEase",
      //                   style: TextStyle(
      //                     color: Colors.green,
      //                     fontSize: 75,
      //                     //fontWeight: FontWeight.bold,
      //                     fontFamily: "Lilita One",
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Text(
      //               "Your Daily Grocery Companion",
      //               style: TextStyle(fontWeight: FontWeight.bold),
      //             ),

      //                          ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
