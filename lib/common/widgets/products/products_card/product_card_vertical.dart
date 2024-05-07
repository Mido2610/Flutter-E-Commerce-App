import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/styles/shadows.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/icons/circular_icon.dart';
import 'package:waflo_admin/common/widgets/images/rounded_image.dart';
import 'package:waflo_admin/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:waflo_admin/common/widgets/texts/product_title_text.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../texts/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProducScreen],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, wishlist button, discount tag
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  const RoundedImage(
                      imageUrl: TImages.productImage38, applyImageRadius: true),

                  // Sale tag
                  Positioned(
                    top: 12,
                    child: RoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      onPressed: () {},
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            // Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ProductTitleText(
                      title: 'Green Nike Air Shoes', smallSize: true),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  BrandTitleTextWithVerifiedIcon(title: 'Nike')
                ],
              ),
            ),
            const Spacer(),
            //Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                const Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: ProductPriceText(price: '979.000')),

                // Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight: Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(Iconsax.add, color: TColors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
