import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/sucess_screen/sucess_screen.dart';
import 'package:waflo_admin/features/shop/screens/cart/widgets/cart_item_view.dart';
import 'package:waflo_admin/features/shop/screens/checkout_screen/widgets/billing_amount_section.dart';
import 'package:waflo_admin/features/shop/screens/checkout_screen/widgets/billing_payment_section.dart';
import 'package:waflo_admin/navigation.menu.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Kiểm Tra Đơn Hàng',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Items in cart
                  const CartItemView(showAddRemoveButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // TextField mã giảm giá

                  const CouponCode(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Billing Section
                  RoundedContainer(
                      showBorder: true,
                      padding: const EdgeInsets.all(TSizes.md),
                      backgroundColor: dark ? TColors.black : TColors.white,
                      child: const Column(
                        children:  [
                          // Pricing
                          BillingAmountSection(),
                          SizedBox(height: TSizes.spaceBtwItems),

                          // Divider
                           Divider(thickness: 2),
                           SizedBox(height: TSizes.spaceBtwItems),

                          // Payment Methods
                          BillingPaymentSection(),
                          SizedBox(height: TSizes.spaceBtwItems),

                          // Address
                        ],
                      ))
                 ],
              ),
          ),
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SucessSreen(
                title: 'Thanh toán thành công!',
                image: TImages.sucessPayment,
                subTitle: 'Hàng của bạn sẽ được vận chuyển',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
              )),
            
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
          ),
          child: const Text('Checkout 250.000 đ'),
        ),
      ),
    );
  }
}