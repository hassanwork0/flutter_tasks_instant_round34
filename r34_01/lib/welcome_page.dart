import 'package:flutter/material.dart';
import 'package:r34_01/home_page/widgets/buttons.dart';
import 'package:r34_01/login_page/login_email_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(color: Colors.white.withOpacity(0.3)),
          Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              children: [
                Text(
                  "Welcome to our",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Lilita One",
                  ),
                ),
                Stack(
                  children: [
                    Text(
                      "GrocerEase",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontFamily: "Lilita One",
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(30)),
                Center(
                  child: Column(
                    children: [
                      Buttons(
                        nameButton: "Continue with Email or Phone ",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginEmailPage(),
                            ),
                          );
                        },
                        backgroundcolor: Colors.white,
                        textcolor: Colors.green,
                      ),
                      SizedBox(height: 10),
                      Buttons(
                        nameButton: "Create an Account",
                        onPressed: () {},
                        backgroundcolor: Colors.green,
                        textcolor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
