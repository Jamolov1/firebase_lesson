import 'package:flutter/material.dart';

import '../../service/pref_service.dart';
import 'intro_page.dart';
import '../main_page/home_page.dart'; // HomePage import qilishni unutmang

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    bool showIntro = await PrefService.loadIntro() ?? false;

    if (showIntro) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => IntroPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/splash.png",
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}
