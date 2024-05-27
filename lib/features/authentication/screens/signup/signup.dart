import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/login_sign_up/form_divider.dart';
import 'package:waflo_admin/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';

import '../../../../common/widgets/login_sign_up/social_button.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(TTexts.signUpTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Form
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Divider
              FormDivider(diverText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Social Buttons
              const SocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
