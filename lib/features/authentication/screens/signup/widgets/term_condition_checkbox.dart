import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TermsConditionCheckBox extends StatelessWidget {
  const TermsConditionCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (vallue) {}),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${TTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${TTexts.privacyPolicy} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary),
          ),
          TextSpan(
              text: '${TTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '${TTexts.termOfUse} ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary),
          )
        ]))
      ],
    );
  }
}
