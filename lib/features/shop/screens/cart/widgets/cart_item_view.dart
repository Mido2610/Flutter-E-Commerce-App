import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({
    Key? key,
    this.showAddRemoveButton = true,

    }) : super(key: key);

    final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          separatorBuilder: (_,__) => const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (_, index) => Column (
            children: [
              const CartItem(),
              if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),
              
              // add remove button with Row with total Price
              if(showAddRemoveButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      //Extra space
                      SizedBox(width: 70),
                      // Add Remove Button
                      ProductQuantityWithAddRemoveButton(),
                    ],
                  ),
                  const ProductPriceText(price: '250.000'),
                ],
              )
            ],
          )
        );
 }

}