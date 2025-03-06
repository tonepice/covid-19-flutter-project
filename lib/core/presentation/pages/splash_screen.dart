import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static var route;

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      // context.go('/dashboard'); // ใช้ GoRouter ไปหน้า Dashboard
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ยินดีต้อนรับ")), // หรือใช้โลโก้แอป
    );
  }
}