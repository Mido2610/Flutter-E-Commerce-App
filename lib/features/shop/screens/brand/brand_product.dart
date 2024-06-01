import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/brands/brand_card.dart';
import 'package:waflo_admin/common/widgets/products/sortable/sortable_products.dart';
import 'package:waflo_admin/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:waflo_admin/features/shop/controllers/brand_controller.dart';
import 'package:waflo_admin/features/shop/models/brand_model.dart';
import 'package:waflo_admin/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Detail
              BrandCard(showBorder: true, brand: brand),
              const SizedBox(height: TSizes.spaceBtwSections),

             FutureBuilder(
               future: controller.getBrandProducts(brandId: brand.id),
               builder: (context, snapshot) {
                  // Handle Loader, No Record, Or Error Message
                  const loader = VerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if(widget != null) return widget;

                  // Record Found!
                  final brandProducts = snapshot.data!;

                 return SortableProducts(products: brandProducts);
               }
             ),
            ],
          )
        )
      )
    );
  }
}
