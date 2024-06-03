import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/controllers/product/check_out_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeadingBar(
            title: 'Payment Method',
            buttonTitle: 'Change',
            onPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(() => Row(
              children: [
                RoundedContainer(
                    width: 60,
                    height: 55,
                    backgroundColor: dark ? TColors.light : TColors.white,
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: Image(
                        image: AssetImage(
                            controller.selectedPaymentMethod.value.image),
                        fit: BoxFit.contain)),
                const SizedBox(width: TSizes.spaceBtwItems / 2),
                Text(controller.selectedPaymentMethod.value.name,
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ))
      ],
    );
  }
}
