import 'package:flutter/material.dart';
import 'package:waflo_admin/features/shop/models/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        RoundedImage( 
          imageUrl: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Title, Price, Title
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleTextWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(child: ProductTitleText(title: cartItem.title, maxLines:  1)),
              
              // Attributes
              Text.rich(
                TextSpan(
                  children: ( cartItem.selectedVariation ?? {}).entries.map((e) => TextSpan(
                    children: [
                      TextSpan(text: ' ${e.key} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: '${e.value} ', style: Theme.of(context).textTheme.bodySmall)
                  ])).toList(),
                ),
              ),
            ],
          ),
        )
      ]
    );
  }
}