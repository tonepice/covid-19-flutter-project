import 'package:flutter/material.dart';

import '../presentation/pages/splash_screen.dart';

class AppRouter {
  static T _args<T>(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments as T;
  }

  static Map<String, WidgetBuilder> routes = {
    SplashScreen.route: (context) => const SplashScreen(),
  };
}
