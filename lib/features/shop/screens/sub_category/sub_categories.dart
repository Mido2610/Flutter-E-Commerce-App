import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/images/rounded_image.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_horizontal.dart';
import 'package:waflo_admin/common/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/controllers/category_controller.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/features/shop/screens/all_products/all_products.dart';
import 'package:waflo_admin/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
        appBar: TAppBar(title: Text(category.name), showBackArrow: true),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Banner
                  const RoundedImage(
                      width: double.infinity,
                      imageUrl: TImages.promoBanner4,
                      applyImageRadius: true),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Sub-Categories
                  FutureBuilder(
                      future: controller.getSubCategory(category.id),
                      builder: (context, snapshot) {
                        const loader = HorizontalProductShimmer();
                        final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                        if (widget != null) return widget;

                        //Record Found
                        final subCategories = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: subCategories.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            final subCategory = subCategories[index];
                            return FutureBuilder(
                              future: controller.getCategoryProducts(categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                // Handle loader , No record, or error message
                                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                                if (widget != null) return widget;      

                                //Record Found
                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    //Heading
                                    SectionHeadingBar(
                                        title: subCategory.name,
                                        onPressed: () => Get.to(
                                          () => AllProducts(
                                              title: subCategory.name,
                                              futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                            ))),
                                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                                
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemCount: products.length,
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(width: TSizes.spaceBtwItems),
                                          itemBuilder: (context, index) => ProductCardHorizontal(product: products[index])),
                                    ),
                                    const SizedBox(height: TSizes.spaceBtwSections),
                                  ],
                                );
                              }
                            );
                          },
                        );
                      })
                ],
              )),
        ));
  }
}
