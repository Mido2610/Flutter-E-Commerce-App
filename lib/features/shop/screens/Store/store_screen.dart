import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/brands/brand_card.dart';
import 'package:waflo_admin/features/shop/controllers/category_controller.dart';
import 'package:waflo_admin/features/shop/screens/brand/all_brands.dart';
import 'package:waflo_admin/features/shop/screens/home/widgets/search_container.dart';
import 'package:waflo_admin/features/shop/screens/store/widgets/category_tab.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/layouts/grid_layout_product.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class CreateStoreScreen extends StatelessWidget {
  const CreateStoreScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length ,
      child: Scaffold(
          appBar: TAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              CartCounterIcon(
                onPressed: () {},
              ),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? Colors.black
                      : Colors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //Search bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const SearchContainer(
                          text: 'Search',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // Featured Brands
                        SectionHeadingBar(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () => Get.to(() => const AllBrandScreen()),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        GridLayOutProduct(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const BrandCard(
                              showBorder: true,
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Tabs
                  bottom: TTabBar(
                    tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
                  ),
              ];
            },
            body:  TabBarView(
              children: categories.map((category) => TCategoryTab(category: category)).toList(),
            ),
          )),
    );
  }
}