import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const JARVISApp());
}

class JARVISApp extends StatelessWidget {
  const JARVISApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JARVIS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.cyan,
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const SplashScreen(),
    );
  }
}