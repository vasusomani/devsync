import 'package:devsync/view/screens/auth/login_screen.dart';
import 'package:devsync/view/screens/dashboard/dashboard_admin_screen.dart';
import 'package:devsync/view/screens/on-boarding/splash_screen.dart';
import 'package:flutter/material.dart';

import '../screens/auth/signup_screen.dart';
import '../screens/dashboard/admin_settings_screen.dart';
import '../screens/terminal/terminal_screen.dart';

class RouteGenerator extends NavigatorObserver {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case '/dashboard_admin':
        return MaterialPageRoute(builder: (_) => const DashboardAdminScreen());
      case '/terminal':
        return MaterialPageRoute(builder: (_) => const TerminalScreen());
      case '/admin_settings':
        return MaterialPageRoute(builder: (_) => const AdminSettings());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}
