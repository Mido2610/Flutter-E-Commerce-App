import 'package:flutter/material.dart';
import 'package:waflo_admin/features/shop/controllers/product/cart_controller.dart';
import 'package:waflo_admin/utils/helpers/pricing_calculator.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key,});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        Row(  
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$$subTotal', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // Phí vận chuyển
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${TPricingCalculator.calculateShippingCost(subTotal, 'VN')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // Phí thuế
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${TPricingCalculator.calculateTax(subTotal, 'VN')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),  
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        // Tổng thanh toán

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${TPricingCalculator.calculateTotalPrice(subTotal, 'VN')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),          
      ]

    );

  }
  
}