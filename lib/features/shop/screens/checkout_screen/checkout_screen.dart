import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/features/shop/controllers/product/cart_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/order_controller.dart';
import 'package:waflo_admin/features/shop/screens/cart/widgets/cart_item_view.dart';
import 'package:waflo_admin/features/shop/screens/checkout_screen/widgets/billing_amount_section.dart';
import 'package:waflo_admin/features/shop/screens/checkout_screen/widgets/billing_payment_section.dart';
import 'package:waflo_admin/utils/helpers/pricing_calculator.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen ({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
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
          onPressed: subTotal > 0 
            ? () => orderController.processOrder(totalAmount)
            : () => TLoaders.warningSnackBar(title: 'Empty Cart', message: 'Please add some items in cart'),         
          style: ElevatedButton.styleFrom(
          ),
          child: Text('Checkout \$$totalAmount'),
        ),
      ),
    );
  }
}