import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      home: const HomeScreen(),
    );
  }
}