import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/styles/spacing_styles.dart';
import 'package:waflo_admin/features/authentication/screens/login/widgets/login_form.dart';
import 'package:waflo_admin/features/authentication/screens/login/widgets/login_header.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';
import 'package:waflo_admin/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_sign_up/form_divider.dart';
import '../../../../common/widgets/login_sign_up/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                // Login, Title & Subtitle
                const LoginHeader(),

                //Form

                const LoginForm(),

                // Divider

                FormDivider(diverText: TTexts.orSignInWith.capitalize!),
                const SizedBox(height: TSizes.spaceBtwSections),
                //Footer
                const SocialButton()
              ],
            )),
      ),
    );
  }
}
