import 'package:flutter/material.dart';
import '../../features/home/presentation/pages/dashboard_screen.dart';
import '../presentation/pages/splash_screen.dart';
class AppRouter {
  // ignore: unused_element
  static T _args<T>(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments as T;
  }

  static Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
    DashBoardScreen.route: (context) => const DashBoardScreen(),
  };
}
