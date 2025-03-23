import 'package:flutter/material.dart';

import 'package:foodtek_project/controllers/on_boarding_controller.dart';
import 'package:foodtek_project/view/screens/custom_list.dart';
import 'package:provider/provider.dart';
import 'package:foodtek_project/model/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = context.read<OnboardingController>();
    onBoardingProvider.onInitController();
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: PageView.builder(
              controller: onBoardingProvider.pageController,
              onPageChanged: (index) {
                onBoardingProvider.screensChanged(index);
              },
              itemCount: onBoardingList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [ 
                      SizedBox(height: 32),
                    Expanded(
                      child: Image.asset(
                        onBoardingList[index].image,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      textAlign: TextAlign.center,
                      onBoardingList[index].title,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(fontSize: 28, color: Color(0xff455A64)),
                    ),
                    SizedBox(height: 16),
                    Text(
                      onBoardingList[index].body,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xff455A64),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                              SizedBox(height: 16),

                    index== 3
              ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      gradient: LinearGradient(
                        colors: [Color(0xff25AE4B), Color(0xff0F481F)],
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "yes, turn it on",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffC2C2C2),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "cancel",
                          style: TextStyle(
                            color: Color(0xff455A64),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
              : InkWell(
                onTap: () {
                      final onBoardingProvider = context.read<OnboardingController>();
     if (onBoardingProvider.currentScreen == 2) {
            onBoardingProvider.buttonNext(context);
          } else {
            onBoardingProvider.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    gradient: LinearGradient(
                      colors: [Color(0xff25AE4B), Color(0xff0F481F)],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "continue",
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16,),
     
          CustomOnBoardingList(onBoardingProvider: onBoardingProvider),
        ],
      ),
    );
  }
}
