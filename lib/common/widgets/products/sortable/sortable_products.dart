import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout_product.dart';
import '../products_card/product_card_vertical.dart';

class SortableProducts extends StatefulWidget {
  const SortableProducts({
    super.key,
  });

  @override
  _SortableProductsState createState() => _SortableProductsState();
}

class _SortableProductsState extends State<SortableProducts> {
  String? _selectedSortOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Drop down
        DropdownButtonFormField<String>(
          value: _selectedSortOption,
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (String? newValue) {
            setState(() {
              _selectedSortOption = newValue;
            });
          },
          items: ['Name', 'Higher Price', 'Lower Price', 'sale', 'Newest']
              .map((String option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Products
        GridLayOutProduct(
          itemCount: 4,
          itemBuilder: (_, index) => ProductCardVertical(product: ProductModel.empty()),
        ),
      ],
    );
  }
}
