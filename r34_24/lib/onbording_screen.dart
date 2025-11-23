import 'package:flutter/material.dart';
import 'package:r34_24/widgets/intro_page_body_area.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          // Background image
          Positioned.fill(
            child: Image.asset('assets/images/storee.jpg',fit: BoxFit.cover, 
  ),
),

          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black45,
                    Colors.black38,
                    Colors.black12,
                  ],
                ),
              ),
            ),
          ),

          const IntroPageBodyArea(),
        ],
      ),
    );
  }
}
