import 'package:flutter/material.dart';
import 'package:r34_24/config/routes/routes_handler.dart';
import 'package:r34_24/config/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}
// app
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // el key dh bamyz byha widget 3an el tani
  
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false, // bta3t screen de bug
      initialRoute: RoutesName.onbordingScreen,
      onGenerateRoute: RoutesHandler.generateRoute,
    );
  }
}