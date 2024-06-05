import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/models/brand_model.dart';
import 'package:waflo_admin/features/shop/screens/brand/brand_product.dart';

import 'brand_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../containers/rounded_container.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
    required this.brand,
    this.isNetworkImage = true,
  });

  final List<String> images;
  final BrandModel brand;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProduct(brand: brand)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brand with product Count
            BrandCard(showBorder: false, brand: brand),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Brand top 3 products
            Row(
                children: images.map((image) => brandTopProductImageWidget(image, context)).toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
        child: RoundedContainer(
      height: 100,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkGrey : TColors.light,
      child: Image(
        fit: BoxFit.contain,
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
      ),
    ));
  }
}
