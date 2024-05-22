import 'package:flutter/material.dart';
import 'package:waflo_admin/features/authentication/controller/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => {
          OnBoardingController.instance.skipPage(),
        },
        child: const Text('Skip'),
      ),
    );
  }
}
