import 'package:flutter/material.dart';
import 'package:r34_01/splash_page.dart';

import 'package:r34_01/src/core/routes/routes.dart';
import 'package:r34_01/src/core/widgets/entrypoint_ui.dart';

import '../../../home_page/home_page.dart';
import '../../../login_page/login_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case RoutesName.entryPointUi:
        return MaterialPageRoute(builder: (_) => const EntryPointUi());

      // case RoutesName.productDetails:
      //   final product = settings.arguments;
      //   return MaterialPageRoute(
      //       builder: (_) => ProductDetailsPage(product: product));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Route Not Found"))),
        );
    }
  }
}
