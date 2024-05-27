import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      routes: {
        "/login": (context) => login_screen(),
        "/home": (context) => home_screeen()
      },
    );
  }
}
