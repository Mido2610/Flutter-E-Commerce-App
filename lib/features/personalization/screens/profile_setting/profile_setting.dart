import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/images/circular_image.dart';
import 'package:waflo_admin/common/widgets/shimmers/shimmer.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/personalization/controllers/user_controller.dart';
import 'package:waflo_admin/features/personalization/screens/profile_setting/widgets/change_name_screen.dart';
import 'package:waflo_admin/features/personalization/screens/profile_setting/widgets/profile_setting_menu.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile Setting'),
      ),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUpLoading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                          : CircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeadingBar(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileSettingMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeNameScreen())),
              ProfileSettingMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

              //Heading personla Info
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeadingBar(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileSettingMenu(title: 'User Id', value: controller.user.value.id, onPressed: () {}),
              ProfileSettingMenu(title: 'E-Mail',  value: controller.user.value.email, onPressed: () {}),
              ProfileSettingMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              ProfileSettingMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileSettingMenu(title: 'Date of Birth', value: '26 Oct 2002', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems), 

              
              Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ))
              ),
            ],
          ),
        ),
      ),
    );
  }
}