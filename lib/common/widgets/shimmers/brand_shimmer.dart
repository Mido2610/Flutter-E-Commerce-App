import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/shimmers/shimmer.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridLayOutProduct(
      mainAxisExtent: 80,
      itemCount: itemCount, 
      itemBuilder: (_,__) => const TShimmerEffect(width: 300, height: 80),
    );
  }

}