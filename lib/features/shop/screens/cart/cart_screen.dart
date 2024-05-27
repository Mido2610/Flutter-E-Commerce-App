import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/features/shop/screens/cart/widgets/cart_item_view.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../checkout_screen/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CheckOutScreen()),
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
          ),
          child: const Text('Checkout 250.000 đ'),
        ),
      ),
      appBar: TAppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: const Padding(
        padding:  EdgeInsets.all(TSizes.defaultSpace),

        // Items In cart
        child:  CartItemView()
      ),
    );
  }
}