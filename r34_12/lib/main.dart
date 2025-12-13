import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

// Blocs
import 'package:market_app/bloc/auth/auth_bloc.dart';
import 'package:market_app/bloc/home/home_event.dart';
import 'package:market_app/bloc/user/user_bloc.dart';
import 'package:market_app/bloc/home/home_bloc.dart';
import 'package:market_app/bloc/favourite/favourite_bloc.dart';
import 'package:market_app/bloc/cart/cart_bloc.dart';
import 'package:market_app/bloc/product_details/product_details_bloc.dart';

// Routes & Data
import 'package:market_app/core/routes/pages.dart';
import 'package:market_app/core/routes/route_name.dart';
import 'package:market_app/source/data.dart';

// Firebase Options 
const firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyA51HpUA4QFP6guzhXFcKc0Hqp2dvnXyrQ",
  authDomain: "crypto-sphere-435723-j9.firebaseapp.com",
  projectId: "crypto-sphere-435723-j9",
  storageBucket: "crypto-sphere-435723-j9.firebasestorage.app",
  messagingSenderId: "291489352345",
  appId: "1:291489352345:web:cafddd51bc3fa81641c608",
  measurementId: "G-9K66K62R6J",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: firebaseOptions);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
     
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),

        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            userBloc: BlocProvider.of<UserBloc>(context),
          ),
        ),

   
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(Data())..add(LoadHomeProducts()),
        ),
        BlocProvider<ProductDetailsBloc>(
          create: (context) => ProductDetailsBloc(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (context) => FavouriteBloc(),
          lazy: false,
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Market App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        initialRoute: RouteName.splash,
        onGenerateRoute: AppRoute.onGenerate,
      ),
    );
  }
}
