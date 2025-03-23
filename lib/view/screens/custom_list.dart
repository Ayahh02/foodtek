import 'package:flutter/material.dart';
import 'package:foodtek_project/controllers/on_boarding_controller.dart';
import 'package:foodtek_project/model/onboarding_model.dart';
import 'package:foodtek_project/view/screens/custom_back_btn.dart';
import 'package:foodtek_project/view/screens/custom_btn.dart';
import 'package:provider/provider.dart';

class CustomOnBoardingList extends StatelessWidget {
  const CustomOnBoardingList({super.key, required this.onBoardingProvider});

  final OnboardingController onBoardingProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: CustomBackButton()),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center ,
              children: [
                ...List.generate(onBoardingList.length, (index) {
                  return Consumer<OnboardingController>(
                    builder: (context, onBoardingProvider, child) {
                      return AnimatedContainer(
                        margin: EdgeInsets.only(right: 2),
                        duration: const Duration(milliseconds: 500),
                        width:
                            onBoardingProvider.currentScreen == index ? 3 : 3,
                        height: 5,
                        decoration: BoxDecoration(
                          color: onBoardingProvider.currentScreen == index
                              ? Colors.black
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      );
                    },
                  );
                }),
              ],
            )),
            Expanded(child: CustomButtonOnBoarding()),
          ],
        ),
      ],
    );
  }
}
