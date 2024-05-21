import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/icons/circular_icon.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                onPressed: () {},
                backgroundColor: TColors.darkGrey,
                height: 40,
                width: 40,
                color : TColors.white
              ),
              const SizedBox(width:  TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              CircularIcon(
                icon: Iconsax.add,
                onPressed: () {},
                backgroundColor: TColors.black,
                height: 40,
                width: 40,
                color: TColors.white
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {}, 
            child: const Text('Add to cart'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              primary : TColors.black,
              side: const BorderSide(color: TColors.black)

            )
            ),
        ],
      ),

    );


 }

}