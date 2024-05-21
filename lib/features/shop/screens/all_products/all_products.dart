import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_vertical.dart';

import '../../../../utils/constants/sizes.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Drop down

              DropdownButtonFormField<dynamic>(
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                onChanged: (value) {},
                items: ['Name', 'Higher Price']
                .map((option) => DropdownMenuItem(child: Text(option)))
                .toList(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Products
              GridLayOutProduct(
                itemCount: 4,
                itemBuilder: (_,index) => const ProductCardVertical()
             ),
            ],
          )
        )
      )
    );
  }
}
