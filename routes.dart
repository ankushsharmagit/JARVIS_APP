import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/setup_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/about_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String setup = '/setup';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String about = '/about';
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _createRoute(const SplashScreen());
      case setup:
        return _createRoute(const SetupScreen());
      case home:
        return _createRoute(const HomeScreen());
      case settings:
        return _createRoute(const SettingsScreen());
      case about:
        return _createRoute(const AboutScreen());
      default:
        return _createRoute(const HomeScreen());
    }
  }
  
  static Route<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}