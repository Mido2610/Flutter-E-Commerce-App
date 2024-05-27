import 'package:flutter/material.dart%20';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../sub_category/sub_categories.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageText(
              image: TImages.shoesIcon,
              title: 'Shoes',
              onTap: () => Get.to(() => const SubCategoriesScreen()),
              backgroundColor: TColors.white,
            );
          }),
    );
  }
}