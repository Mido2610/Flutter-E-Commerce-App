import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';

import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/constants/text_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal Scrollable View
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: TImages.onBoardingImage1,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: TImages.onBoardingImage2,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: TImages.onBoardingImage3,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3),
            ],
          ),

          // Skip button
          const OnBoardingSkip(),

          // Dot Navigator SmoothPageIndicator
          const OnBoardingDotNavgation(),

          // Circular Buttton
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
