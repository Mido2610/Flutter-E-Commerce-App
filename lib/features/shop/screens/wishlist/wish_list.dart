import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/icons/circular_icon.dart';
import 'package:waflo_admin/common/widgets/layouts/grid_layout_product.dart';
import 'package:waflo_admin/common/widgets/loaders/animation_loader.dart';
import 'package:waflo_admin/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:waflo_admin/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:waflo_admin/features/shop/controllers/product/favourites_controller.dart';
import 'package:waflo_admin/features/shop/screens/home/home.dart';
import 'package:waflo_admin/navigation.menu.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/sizes.dart';

class CreateWishListSCreen extends StatelessWidget {
  const CreateWishListSCreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
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
          child: Obx(
            () => FutureBuilder(
              future: controller.favouriteProducts(),
              builder: (context, snapshot) {
                // nothing found widget
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Wishlist is empty', 
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );
                const loader = VerticalProductShimmer(itemCount: 6);
                final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader, nothingFound: emptyWidget);
                if(widget != null) return widget;
            
                final products = snapshot.data!;
                return GridLayOutProduct(
                    itemCount: products.length,
                    itemBuilder: (_, index) => ProductCardVertical(product: products[index]));
              }
            ),
          ),
        ),
      ),
    );
  }
}
