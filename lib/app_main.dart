import 'package:flutter/material.dart';
import 'package:foodtek_project/controllers/on_boarding_controller.dart';
import 'package:foodtek_project/controllers/auth_provider.dart';
import 'package:foodtek_project/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingController(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(), // Add AuthProvider here
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
