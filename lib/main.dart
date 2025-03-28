import 'package:flutter/material.dart';
import 'package:foodtek_project/app_main.dart';
import 'package:foodtek_project/view/login.dart';
import 'package:foodtek_project/view/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: AppMain(),
      //home: LoginPage(),
      home: SignupPage(),
    );
  }
}