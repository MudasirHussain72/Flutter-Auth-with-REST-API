import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_one/screens/home_screen.dart';
import 'package:task_one/screens/login_screen.dart';
import 'package:task_one/screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffE43228),
      ),
      title: "Task One",
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/LoginScreen": (context) => const LoginScreen(),
        "/HomeScreen": (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
