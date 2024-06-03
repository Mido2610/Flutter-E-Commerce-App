import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/containers/rounded_container.dart';
import 'package:waflo_admin/common/widgets/loaders/animation_loader.dart';
import 'package:waflo_admin/features/shop/controllers/product/order_controller.dart';
import 'package:waflo_admin/navigation.menu.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/helpers/cloud_helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        //Nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! No Orders Found',
          animation: TImages.orderCompletedAnimation,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        // Helper function: Handle Loader, No record, or error message
        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) { 
            final order = orders[index];
            return RoundedContainer(
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
                          Text(order.orderStatusText, 
                          style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: TColors.primary, 
                            fontWeightDelta: 1)),
                          Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineMedium),
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
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.labelMedium),
                                Text(order.id,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium),
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
                            Text('Shipping Date', 
                            style: Theme.of(context).textTheme.labelMedium),
                            Text(order.formattedDeliveryDate,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, 
                            style: Theme.of(context).textTheme.titleMedium),
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
          );
          }
        );
      }
    );
  }
}