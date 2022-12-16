import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashTimer() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/LoginScreen");
    });
  }

  @override
  void initState() {
    super.initState();
    splashTimer();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        height: size.height / 3.8,
        "assets/logo.jpg",
      )),
    );
  }
}
