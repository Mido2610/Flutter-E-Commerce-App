import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: TSizes.spaceBtwItems / 2 ),
          
                // 2 - Status & Date 
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Đang giao hàng', 
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                        color: TColors.primary, 
                        fontWeightDelta: 1)),
                      Text('07 Nov 2024', style: Theme.of(context).textTheme.headlineMedium),
                    ],
                  ),
                ),
                // 3- Icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)
                ), 
              ],
            ), 
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems / 2 ),                    
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', 
                            style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),                  
                    ],
                  ),
                ),
            Expanded(
              child: Row(
                children: [
                  const Icon(Iconsax.calendar),
                  const SizedBox(width: TSizes.spaceBtwItems / 2 ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ngày dự tính giao hàng', 
                        style: Theme.of(context).textTheme.labelMedium),
                        Text('09 Nov 2024', style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                  ), 
                ],
              ),
            ),              
              ],
            ),
          ],
        ),
      ),
    );
  }
}