import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/features/shop/controllers/product/check_out_controller.dart';
import 'package:waflo_admin/features/shop/models/payment_method_model.dart';
import 'package:waflo_admin/utils/constants/colors.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: RoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: dark ? TColors.light : TColors.white,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );

  }

}