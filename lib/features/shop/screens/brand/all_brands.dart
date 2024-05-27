import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/brands/brand_card.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/screens/brand/brand_product.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child:  Column(
            children: [
              // Heading
              const SectionHeadingBar(title: 'Brands', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Brands 
              GridLayOutProduct(
                itemCount: 10 , 
                mainAxisExtent: 80,
                itemBuilder: (context, index) => BrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProduct())
                ),
              ),
            ],
          )
        )
      )
    );
  }

}
