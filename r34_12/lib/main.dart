import 'package:flutter/material.dart';
import 'package:market_app/routes/pages.dart';
import 'package:market_app/routes/route_name.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Market',
      debugShowCheckedModeBanner: false,

   
      initialRoute: RouteName.splash,
      onGenerateRoute: AppRoute.onGenerate,

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
