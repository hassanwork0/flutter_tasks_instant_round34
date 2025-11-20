import 'package:flutter/material.dart';
import 'package:r34_01/home_page/widgets/buttons.dart';
import 'package:r34_01/login_page/login_page.dart';
import 'package:r34_01/login_page/widgets/inkwell_buttons.dart';
import 'package:r34_01/widgets/name_style.dart';

class LoginEmailPage extends StatelessWidget {
  const LoginEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 255, 244),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),

          Image.asset("assets/images/1.png", width: 300),
          Text(
            "Welcome to our",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          NameStyle(fontSize: 30),
          SizedBox(height: 80),
          Buttons(
            nameButton: "Login With Email",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            backgroundcolor: Colors.green,
            textcolor: Colors.white,
          ),
          SizedBox(height: 30),

          Text(
            "OR",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkwellButtons(
                image: "assets/images/apple.png",
                height: 70,
                width: 70,
                color: Colors.black,
              ),

              SizedBox(width: 20),
              InkwellButtons(
                image: "assets/images/g+.png",
                height: 20,
                width: 20,
                color: Colors.red,
              ),
              SizedBox(width: 20),

              InkwellButtons(
                image: "assets/images/logo-3491390_640.png",
                height: 60,
                width: 60,
                color: Colors.lightBlue,
              ),
              SizedBox(width: 20),

              InkwellButtons(
                image: "assets/images/facebook.png",
                height: 60,
                width: 60,
                color: Color(0xff4971B7),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
