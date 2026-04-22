// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.cyan,
      ),
      body: const Center(
        child: Text(
          'Settings Screen - Coming Soon',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}