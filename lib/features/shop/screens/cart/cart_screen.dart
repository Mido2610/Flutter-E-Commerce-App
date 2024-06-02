import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/loaders/animation_loader.dart';
import 'package:waflo_admin/features/shop/controllers/product/cart_controller.dart';
import 'package:waflo_admin/features/shop/screens/cart/widgets/cart_item_view.dart';
import 'package:waflo_admin/navigation.menu.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';

import '../../../../utils/constants/sizes.dart';
import '../checkout_screen/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
        body: Obx(
          () {
            // Nothing found widget
            final emptyWidget = TAnimationLoaderWidget(
                text: 'Whoops! Cart is Empty',
                animation: TImages.cartAnimation,
                showAction: true,
                actionText: 'Let\'s fill it',
                onActionPressed: () => Get.off(() => const NavigationMenu()));
            if (controller.cartItems.isEmpty) {
              return emptyWidget;
            } else {
              return const SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                
                    // Item in cart
                    child: CartItemView()),
              );
            }
          },
        ),

      // Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckOutScreen()),
                child: Obx(() =>
                    Text('Check out \$${controller.totalCartPrice.value}')),
              ),
            ),
    );
  }
}