import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/features/shop/screens/product_review/widgets/rating_progress_indicator.dart';
import 'package:waflo_admin/features/shop/screens/product_review/widgets/user_review_cart.dart';

import '../../../../common/widgets/products/rating/rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({
    Key? key

    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(title: Text('Review & Ratings'), showBackArrow: true),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Text('Rating and reviews are verified and are people from people who use the same type of device that you use '),
              const SizedBox(height: TSizes.spaceBtwItems),

          // Overall Product Ratings 
          const OverallProductRating(),
          const RatingBarIndicatorV1(rating: 3.5),
          Text('12,611', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: TSizes.spaceBtwItems),

          // User Reviews List
          const UserReviewCard(),
          const UserReviewCard(),
          const UserReviewCard(),

          

          ],
        ),
        ),
      )


    );


  }
}