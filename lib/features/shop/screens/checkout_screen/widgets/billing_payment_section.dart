import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column (
        children: [
          SectionHeadingBar(title: 'Phương thức thanh toán', buttonTitle: 'Thay đổi', onPressed: () {}),
          const SizedBox(height: TSizes.spaceBtwItems / 2), 
          Row(
            children: [
              RoundedContainer(
                width: 60,
                height: 55, 
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: const EdgeInsets.all(TSizes.sm),
                child: const Image(
                  image: AssetImage(TImages.paypal),
                  fit: BoxFit.contain
                )
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
            ],
          )
        ],
    );
  }

}