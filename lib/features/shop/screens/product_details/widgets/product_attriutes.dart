import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/texts/product_price_text.dart';
import 'package:waflo_admin/common/widgets/texts/product_title_text.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/chips/choice_chip_v1.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column (
      children: [
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
                          Text('25 đ', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: TSizes.spaceBtwItems),
                          //Sale price
              
                          const ProductPriceText(price: '20')                  
                        ],
                      ),
                      // sTOCK
                      Row (
                        children: [
                          const ProductTitleText(title: 'Stock : ', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Description
              const SizedBox(height: TSizes.spaceBtwItems / 1.5),
              const ProductTitleText(title: 'This is a description it can go 4 max lines and it can go more than you can', smallSize: true, maxLines: 4,),


            ],
          ),
          
        ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Attributes
          Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeadingBar(title: 'Colors', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children:  [
                  ChoiceChipV1(text: 'Green', selected : true, onSelected: (value) {}),
                  ChoiceChipV1(text: 'Blue', selected : false, onSelected: (value) {}),
                  ChoiceChipV1(text: 'Yellow', selected : false, onSelected: (value) {}),                 
                  ],
                ),

            ],
            // Size
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
    );
  }
}