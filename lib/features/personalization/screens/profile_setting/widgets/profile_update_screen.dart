import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/list_titles/setting_menu_tile.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/controllers/category_controller.dart';
import 'package:waflo_admin/utils/constants/colors.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';
import 'package:get/get.dart';

class UploadLoadDataScreen extends StatelessWidget {
  const UploadLoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      backgroundColor: TColors.white,
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Upload Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: TColors.white,
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              // Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Record Section
                    const SectionHeadingBar(
                      title: 'Main Record',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    FutureBuilder(
                      future: controller.fetchCategories(),
                      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          return Column(
                            children: [
                              SettingMenuTile(
                                icon: Iconsax.category,
                                title: 'Upload Categories',
                                subtitle: '',
                                onTap: () async {
                                  await controller.fetchCategories();
                                  Get.snackbar(
                                    'Success',
                                    'Categories fetched successfully!',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: TColors.primary,
                                    colorText: Colors.white,
                                  );
                                },
                                trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                              ),
                              SettingMenuTile(
                                icon: Iconsax.shop,
                                title: 'Upload Brands',
                                subtitle: '',
                                onTap: () {},
                                trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                              ),
                              SettingMenuTile(
                                icon: Iconsax.bag,
                                title: 'Upload Products',
                                subtitle: '',
                                onTap: () {},
                                trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                              ),
                              SettingMenuTile(
                                icon: Iconsax.image,
                                title: 'Upload Banners',
                                subtitle: '',
                                onTap: () {},
                                trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    // Relationships Section
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const SectionHeadingBar(
                      title: 'Relationships',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Text(
                      'Make sure you have already uploaded all the content above.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SettingMenuTile(
                      icon: Iconsax.link,
                      title: 'Upload Brands & Categories Relation Data',
                      subtitle: '',
                      onTap: () {},
                      trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                    ),
                    SettingMenuTile(
                      icon: Iconsax.link,
                      title: 'Upload Product Categories Relational Data',
                      subtitle: '',
                      onTap: () {},
                      trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
