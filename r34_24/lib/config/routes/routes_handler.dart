import 'package:flutter/material.dart';
import 'package:r34_24/config/routes/routes_name.dart';
import 'package:r34_24/splash_screen.dart';
import 'package:r34_24/onbording_screen.dart';
import 'package:r34_24/homepage_screen.dart';
import 'package:r34_24/product_details_page.dart';


class RoutesHandler {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
        case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) =>  SplashScreen(),
        );
        case RoutesName.onbordingScreen:
        return MaterialPageRoute(
          builder: (context) =>  OnbordingScreen(),
        );
        case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (context) =>  HomepageScreen(),
        );
        case RoutesName.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) =>  const ProductDetailsPage(),
        ); 
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          ),
        );
    }
  }
}
