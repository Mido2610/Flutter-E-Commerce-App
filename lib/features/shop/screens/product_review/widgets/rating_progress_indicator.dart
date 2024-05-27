import 'package:flutter/material.dart';
import 'package:waflo_admin/features/shop/screens/product_review/widgets/progress_indicator_and_rating.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.8',
                style:
                    Theme.of(context).textTheme.displayMedium)),
        const Expanded(
          flex: 7,
          child: Column(
            children:  [
               RatingProgressIndicator(text: '5', value: 1.0),
               RatingProgressIndicator(text: '3', value: 0.8),
               RatingProgressIndicator(text: '2', value: 0.7),
               RatingProgressIndicator(text: '1', value: 1.0),
               RatingProgressIndicator(text: '', value: 1.0),

            ],
          ),
        )
      ],
    );
  }
}