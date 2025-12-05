import 'package:flutter/material.dart';
import 'package:market_app/routes/route_name.dart';
import 'package:market_app/screens/Social_Login.dart';
import 'package:market_app/screens/account.dart';
import 'package:market_app/screens/explore.dart';
import 'package:market_app/screens/splash.dart';
import 'package:market_app/screens/onboarding_page.dart';
import 'package:market_app/screens/login.dart';
import 'package:market_app/screens/signup.dart';
import 'package:market_app/screens/home_page.dart';
import 'package:market_app/screens/cart.dart';
import 'package:market_app/screens/favourite.dart';
import 'package:market_app/screens/Location.dart';

class AppRoute {
  static Route<dynamic> onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.init:
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.onboarding:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case RouteName.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RouteName.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());

      case RouteName.favorite:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());

      case RouteName.location:
        return MaterialPageRoute(builder: (_) => const LocationScreen());

      case RouteName.account:
        return MaterialPageRoute(builder: (_) => AccountScreen());

      case RouteName.explore:
        return MaterialPageRoute(builder: (_) => ExploreScreen());


      case RouteName.social:
        return MaterialPageRoute(builder: (_) => SocialLoginScreen());

     
   
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Route not found"),
            ),
          ),
        );
    }
  }
}
