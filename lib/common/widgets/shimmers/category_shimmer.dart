import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/shimmers/shimmer.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
    });
    final int itemCount;

  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_,__) {
            return const Column(
              children: [
                /// Image
                TShimmerEffect(width: 55, height: 55, radius: 55),
                SizedBox(height: TSizes.spaceBtwItems / 2),

                /// Text
                TShimmerEffect(width: 55, height: 8)
              ],  
            );
          } 
        )
      );
  }

}