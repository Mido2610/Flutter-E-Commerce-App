import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/icons/circular_icon.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:waflo_admin/features/shop/screens/home/home.dart';

import '../../../../utils/constants/sizes.dart';

class CreateWishListSCreen extends StatelessWidget {
  const CreateWishListSCreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Product',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
              icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayOutProduct(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
