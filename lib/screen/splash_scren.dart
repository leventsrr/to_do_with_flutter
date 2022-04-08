import 'package:flutter/material.dart';
import 'package:uyari_programi/screen/to_do_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ToDoScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/SplashScreen.png',
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
