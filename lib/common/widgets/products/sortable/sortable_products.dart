import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/features/shop/controllers/all_product_controller.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout_product.dart';
import '../products_card/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        // Drop down
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {
            controller.sortProducts(value!);
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'sale', 'Newest']
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        // Products
        Obx(
          () => GridLayOutProduct(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => ProductCardVertical(product: controller.products[index]), 
          ),
        ),
      ],
    );
  }
}
