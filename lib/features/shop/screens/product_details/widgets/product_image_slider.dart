import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/features/shop/controllers/product/images_controller.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custome_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          // Main Large Image
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child:
                      Obx(() { 
                        final image = controller.selectedProductImage.value;
                        return GestureDetector(
                          onTap: () => controller.showEnlargeImage(image),
                          child: CachedNetworkImage(imageUrl: image, progressIndicatorBuilder: (_,__, downloadProgress) 
                          => CircularProgressIndicator(value: downloadProgress.progress, color: TColors.primary)),
                        );
                      }),
                ),
              ),
            ),

            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImage.value  == images[index];
                    return RoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      padding: const EdgeInsets.all(TSizes.sm),
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                    );
                  }
                  ),
                ),
              ),
            ),

            TAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(icon: Iconsax.heart, onPressed: () {}, color: Colors.red )
              ],
            )
          ],
        ),
      ),
    );
  }
}