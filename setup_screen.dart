import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/colors.dart';
import 'home_screen.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});
  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  int _step = 0;
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JarvisColors.bgPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                'JARVIS SETUP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: JarvisColors.accentCyan,
                ),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: _step == 0 ? 0.5 : 1.0,
                backgroundColor: JarvisColors.textHint.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation(JarvisColors.accentCyan),
              ),
              const SizedBox(height: 40),
              if (_step == 0) _buildFaceStep(),
              if (_step == 1) _buildVoiceStep(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildFaceStep() {
    return Column(
      children: [
        const Icon(Icons.face, size: 80, color: JarvisColors.accentCyan),
        const SizedBox(height: 20),
        const Text(
          'Face Registration',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          'Apna face camera ke saamne rakhein',
          style: TextStyle(color: JarvisColors.textSecondary),
        ),
        const SizedBox(height: 30),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: JarvisColors.bgCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: JarvisColors.accentCyan),
          ),
          child: const Center(
            child: Icon(Icons.camera_alt, size: 50, color: JarvisColors.textHint),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _step = 1;
            });
          },
          child: const Text('Next: Voice Registration'),
        ),
      ],
    );
  }
  
  Widget _buildVoiceStep() {
    return Column(
      children: [
        const Icon(Icons.mic, size: 80, color: JarvisColors.accentCyan),
        const SizedBox(height: 20),
        const Text(
          'Voice Registration',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 10),
        const Text(
          'Yeh sentence boliye: "Mera naam Mukul hai"',
          style: TextStyle(color: JarvisColors.textSecondary),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: JarvisColors.bgCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: JarvisColors.accentCyan),
          ),
          child: const Text(
            '🎤 Tap to record',
            style: TextStyle(color: JarvisColors.accentCyan),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            await Future.delayed(const Duration(seconds: 2));
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('first_launch', false);
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }
          },
          child: _isLoading 
              ? const CircularProgressIndicator(color: Colors.black)
              : const Text('Complete Setup'),
        ),
      ],
    );
  }
}