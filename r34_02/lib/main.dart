import 'package:flutter/material.dart';
import 'package:flutter_store_task_app/src/core/constants/colors.dart';
import 'package:flutter_store_task_app/src/features/auth/data/implements/auth_repository_imp.dart';
import 'package:flutter_store_task_app/src/features/auth/domain/auth_provider.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/number_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/onboarding_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/signin_landing_screen.dart';
import 'package:flutter_store_task_app/src/features/auth/presentation/pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(authRepository: AuthRepositoryImp()),
        ),

        // ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        title: 'Nectar Grocery',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/signin_landing': (context) => const SignInLandingScreen(),
          '/enter_number': (context) => const NumberScreen(),
          '/login': (context) => const LoginScreen(),
          //'/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

// Simple Splash Screen (Kept for context)
