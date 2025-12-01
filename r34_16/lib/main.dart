import 'src/core/config/config.dart'; 
import 'package:flutter/material.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await DependencyInjection.init();
  runApp(const App());
}
