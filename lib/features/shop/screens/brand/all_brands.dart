import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/brands/brand_card.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/shimmers/brand_shimmer.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/controllers/brand_controller.dart';
import 'package:waflo_admin/features/shop/screens/brand/brand_product.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
        appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    // Heading
                    const SectionHeadingBar(title: 'Brands', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    // Brands
                    Obx(() {
                      if (brandController.isLoading.value) return const BrandShimmer();
                      if (brandController.allBrands.isEmpty) {
                        return Center(child: Text('No Brands Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),
                        );
                      }
                      return GridLayOutProduct(
                        itemCount: brandController.allBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = brandController.allBrands[index];
                          return BrandCard(
                            showBorder: true, 
                            brand: brand,
                            onTap: () => Get.to(() => BrandProduct(brand: brand))
                          );
                        },
                      );
                    }),
                  ],
                ))));
  }
}
