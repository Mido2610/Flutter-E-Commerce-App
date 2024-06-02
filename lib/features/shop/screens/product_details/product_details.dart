
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:waflo_admin/features/shop/screens/product_details/widgets/product_attriutes.dart';
import 'package:waflo_admin/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:waflo_admin/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:waflo_admin/features/shop/screens/product_details/widgets/product_rating_share.dart';
import 'package:waflo_admin/utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../product_review/product_review.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider
            ProductImageSlider(product: product),
            // Product Details
            Padding(
                padding: const EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    // Rating & share button
                    const RatingAndShare(),

                    //    Price, Title, Stock & Brand
                    ProductMetaData(product: product),

                    // Attributes
                    if(product.productType == ProductType.variable.toString()) ProductAttributes(product: product),
                    if(product.productType == ProductType.variable.toString()) const SizedBox(height: TSizes.spaceBtwSections),

                    // Checkout button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Checkout'))),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    // Description
                    const SectionHeadingBar(
                        title: 'Description', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    ReadMoreText(
                      product.description ?? '',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Show less',
                      moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),

                    // Reviews
                    const Divider(thickness: 2,),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SectionHeadingBar(title: 'Review(199)', showActionButton: false),
                        IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: ()=> Get.to(() => const ProductReviewScreen())),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}