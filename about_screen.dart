// lib/screens/about_screen.dart
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.android, size: 80, color: Colors.cyan),
            SizedBox(height: 20),
            Text(
              'JARVIS v4.0',
              style: TextStyle(color: Colors.cyan, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Just A Rather Very Intelligent System',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 20),
            Text(
              'Built for Mukul Sir',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}