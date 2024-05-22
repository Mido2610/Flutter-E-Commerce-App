import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/brands/brand_card.dart';
import 'package:waflo_admin/common/widgets/products/sortable/sortable_products.dart';

import '../../../../utils/constants/sizes.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children:const  [
              // Brand Detail
              BrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections),

              SortableProducts(),
            ],
          )
        )
      )
    );
  }
}
