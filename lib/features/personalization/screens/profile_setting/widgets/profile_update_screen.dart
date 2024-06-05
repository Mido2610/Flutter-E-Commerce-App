import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/list_titles/setting_menu_tile.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/data/services/dummy_data.dart';
import 'package:waflo_admin/features/shop/controllers/banner_controller.dart';
import 'package:waflo_admin/features/shop/controllers/brand_controller.dart';
import 'package:waflo_admin/features/shop/controllers/category_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/product_controller.dart';
import 'package:waflo_admin/utils/constants/colors.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';

class UploadLoadDataScreen extends StatelessWidget {
  const UploadLoadDataScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final categoryController = CategoryController.instance;
    final brandController = BrandController.instance;
    final bannerController = BannerController.instance;
    final productController = ProductController.instance;
    final brandCategoryController = BrandController.instance;
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
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeadingBar(
                      title: 'Main Record',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    
                        SettingMenuTile(
                          icon: Iconsax.category,
                          title: 'Upload Categories',
                          subtitle: '',
                          onTap: () async {
                            await categoryController.uploadCategoryToFireBase();
                            
                          },
                          trailing: const Icon(Iconsax.document_upload4,
                              color: TColors.primary),
                        ),             
                    const SizedBox(height: TSizes.spaceBtwItems),
                        SettingMenuTile(
                          icon: Iconsax.shop,
                          title: 'Upload Brands',
                          subtitle: '',
                          onTap: () async{
                            await brandController.uploadBrandToFireBase();
                          },
                          trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                        ),
                    SettingMenuTile(
                      icon: Iconsax.bag,
                      title: 'Upload Products',
                      subtitle: '',
                      onTap: () async {
                        await productController.uploadProductToFireBase(DummyData.products);
                      },
                      trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                    ),
                    FutureBuilder(
                      future: bannerController.fetchBanners(),
                      builder: (context, snapshot) {
                        return SettingMenuTile(
                          icon: Iconsax.shop,
                          title: 'Upload Banner',
                          subtitle: '',
                          onTap: () async {
                            await bannerController.uploadData();
                          },
                          trailing: const Icon(Iconsax.document_upload4, color: TColors.primary),
                        );
                      }
                    ),
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
                      onTap: () async {
                        await brandCategoryController.uploadBrandCategoryToFireBase();
                      },
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



