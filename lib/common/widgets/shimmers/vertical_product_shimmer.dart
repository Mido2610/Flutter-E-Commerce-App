import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/shimmers/shimmer.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({super.key, this.itemCount = 4});
  
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayOutProduct(
      itemCount: itemCount, 
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image 
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems),

            // Text
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems),
            TShimmerEffect(width: 110, height: 15),
          ],
        )
      )
    );
  }

}