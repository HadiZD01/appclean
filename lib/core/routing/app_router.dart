import 'package:appclean/core/routing/routes.dart';
import 'package:appclean/feature/login/ui/login_screen.dart';
import 'package:appclean/feature/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingscreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // Define your routes here
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
