import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              const BrandShowCase(
                images: [
                  TImages.productImage39,
                  TImages.productImage40,
                  TImages.productImage41,
                ],
              ),
              const BrandShowCase(
                images: [
                  TImages.productImage39,
                  TImages.productImage40,
                  TImages.productImage41,
                ],
              ),
              // Products

              SectionHeadingBar(
                title: 'You Might Like',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              GridLayOutProduct(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}