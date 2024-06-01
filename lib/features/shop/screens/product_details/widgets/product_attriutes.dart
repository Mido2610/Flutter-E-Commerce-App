import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/texts/product_price_text.dart';
import 'package:waflo_admin/common/widgets/texts/product_title_text.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/controllers/product/variation_controller.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';

import '../../../../../common/widgets/chips/choice_chip_v1.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column (
        children: [
          //  display variation price and stock when some variation is selected
          if(controller.selectedVariation.value.id.isNotEmpty)
          RoundedContainer(
            padding: const EdgeInsets.all(TSizes.md),
            backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  Title, Price and Stock Status 
                Row(
                  children: [
                    const SectionHeadingBar(title: 'Variation',showActionButton: false),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Title & Price and Stock status
                        Row(
                          children: [
                            const ProductTitleText(title: 'Price : ', smallSize: true),
                
                            // Actual Price
                            if(controller.selectedVariation.value.salePrice > 0)
                            Text('\$${controller.selectedVariation.value.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            //Sale price
                
                            ProductPriceText(price: controller.getVariationPrice()),        
                          ],
                        ),
                        // sTOCK
                        Row (
                          children: [
                            const ProductTitleText(title: 'Stock : ', smallSize: true),
                            Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
      
                // Description
                const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                ProductTitleText(title: controller.selectedVariation.value.description ?? '', smallSize: true, maxLines: 4),
      
      
              ],
            ),
            
          ),
            const SizedBox(height: TSizes.spaceBtwItems),
      
            // Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionHeadingBar(title: attribute.name ?? '', showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final  isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                              final available = controller
                                    .getAttributeAvailabilityInVariation(product.productVariations!, attribute.name!)
                                    .contains(attributeValue);
                              return ChoiceChipV1(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available ? (selected) {
                                    if(selected && available){
                                      controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                    }
                                  } : null);
                              }).toList(),
                          ),
                        ),
                      ],
                      // Size
                    ))
                .toList(),
          ),
            Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeadingBar(title: 'Size', showActionButton: false,),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Wrap(
                  spacing: 8,
                  children:  [
                    ChoiceChipV1(text: 'EU 34', selected : true, onSelected: (value) {}),
                    ChoiceChipV1(text: 'EU 36', selected : false, onSelected: (value) {}),
                    ChoiceChipV1(text: 'EU 38', selected : false, onSelected: (value) {}),                 
                    ],
                  ),
      
              ],
            ),        
        ],
      ),
    );
  }
}