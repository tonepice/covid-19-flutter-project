import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../../features/home/presentation/pages/dashboard_screen.dart';
import '../../images/images.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) async {
        await bootApp();
      },
    );
  }

  Future<void> bootApp() async {
    // Implement method if you have logic to start
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.pushReplacementNamed(context, DashBoardScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(30),
        child: Text(
          "Powered by SOCKET 9 CO.,LTD.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: TextTheme.of(context).bodyLarge?.fontSize ?? 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Image.asset(
          width: 250,
          height: 250,
          alignment: Alignment.topCenter,
          CommonImage.logoSplash,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
