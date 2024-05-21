import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:waflo_admin/features/shop/screens/all_products/all_products.dart';
import 'package:waflo_admin/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:waflo_admin/features/shop/screens/home/widgets/home_categories.dart';
import 'package:waflo_admin/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:waflo_admin/features/shop/screens/home/widgets/search_container.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';

import '../../../../common/widgets/custome_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/layouts/grid_layout_product.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appar
                  const HomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Search Bar

                  const SearchContainer(text: 'Search'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: const [
                        // Heading

                        SectionHeadingBar(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        //Categories
                        HomeCategories()
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Heading
                  SectionHeadingBar(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Popular Products
                  GridLayOutProduct(
                    itemCount: 2,
                    itemBuilder: (_, index) => const ProductCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}






