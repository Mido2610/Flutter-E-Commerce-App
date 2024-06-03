import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/authentication/authentication_repostiory.dart';
import 'package:waflo_admin/features/authentication/controller/signup/verify_email_controller.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
    this.email
    });
    final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                icon: const Icon(CupertinoIcons.clear))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Image

                Image(
                  image: const AssetImage(TImages.deliveredEmailIllustration),
                  width: THelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Title & Subtitle

                Text(
                  TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text(
                  TTexts.confirmMailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(TTexts.tContinue),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text(TTexts.resendEmail),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
