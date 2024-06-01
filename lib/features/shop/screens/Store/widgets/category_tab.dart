import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:waflo_admin/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/controllers/category_controller.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/features/shop/screens/all_products/all_products.dart';
import 'package:waflo_admin/features/shop/screens/store/widgets/category_brand.dart';
import 'package:waflo_admin/utils/helpers/cloud_helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key,required this.category});
  
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              CategoryBrands(category: category),
              const SizedBox(height: TSizes.spaceBtwItems),
              // Products

              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: const VerticalProductShimmer());
                  if(response != null) return response;           

                  // Record Found
                  final products = snapshot.data!;       
                  return Column(
                    children: [
                      SectionHeadingBar(
                        title: 'You Might Like',
                        onPressed: () => Get.to(() => AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                            )),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      GridLayOutProduct(
                        itemCount: products.length,
                        itemBuilder: (_, index) => ProductCardVertical(product: products[index])),        
                    ]
                  );
                }
              ),

            ],
          ),
        ),
      ],
    );
  }
}