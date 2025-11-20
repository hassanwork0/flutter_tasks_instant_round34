import 'package:flutter/material.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/number_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/signin_landing_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/splash_screen.dart';
import '/src/core/error/error.dart';
import '/src/core/animation/animation.dart';
import 'routes.dart';

class RouteHandler {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      // case RouteNames.home_screen:
      //   return MaterialPageRoute(
      //     builder: (context) => HomeScreen(),
      //   );
      case RouteNames.onboarding_screen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );

      case RouteNames.enter_number_screen:
        return MaterialPageRoute(builder: (context) => const NumberScreen());

      case RouteNames.signin_landing_screen:
        return MaterialPageRoute(
          builder: (context) => const SignInLandingScreen(),
        );
      case RouteNames.login_screen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
