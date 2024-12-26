import 'package:flutter/material.dart';
import 'screens/farmer_details.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Irrigation',
      debugShowCheckedModeBanner: false,  
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.lightGreen[50], 
      ),
      initialRoute: '/',
      routes: {
      '/': (context) => const OnboardingPage(),
      '/login': (context) => const LoginPage(),
      '/farmer_details': (context) => const FarmerDetailsPage(),
      '/home': (context) => const HomePage(),
      },
    );
  }
}
