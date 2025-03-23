import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodtek_project/controllers/on_boarding_controller.dart';
import 'package:provider/provider.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = context.read<OnboardingController>();
    return TextButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      onPressed: () {
        if (onBoardingProvider.currentScreen > 0) {
          onBoardingProvider.buttonBack(context);
          log("Back");
          // Return to the previous page
        }
      },
      child: Text(
        "Skip",
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
