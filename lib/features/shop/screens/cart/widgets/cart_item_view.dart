import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/controllers/product/cart_controller.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({
    super.key,
    this.showAddRemoveButton = true,

    });

    final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
            separatorBuilder: (_,__) => const SizedBox(height: TSizes.spaceBtwSections),
            itemCount: cartController.cartItems.length,
            shrinkWrap: true,
            itemBuilder: (_, index) => Obx(() {
              final item = cartController.cartItems[index]; 
               return Column (
                children: [
                  CartItem(cartItem: item),
                  if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),
                  
                  // add remove button with Row with total Price
                  if(showAddRemoveButton)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //Extra space
                          const SizedBox(width: 70),
                          // Add Remove Button
                              ProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () => cartController.removeOneFromCart(item),
                              ),
                        ],
                      ),
                      ProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                    ],
                  )
                ],
              );
            }
            )
          ),
    );
 }

}