import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/appbar/appbar.dart';
import 'package:waflo_admin/common/widgets/images/circular_image.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/personalization/screens/profile_setting/widgets/profile_setting_menu.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeadingBar(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileSettingMenu(title: 'Name', value: 'Tuan Kiet', onPressed: () {}),
              ProfileSettingMenu(title: 'Username', value: 'Mido2610', onPressed: () {}),

              //Heading personla Info
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeadingBar(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileSettingMenu(title: 'User Id', value: '123456', onPressed: () {}),
              ProfileSettingMenu(title: 'E-Mail',  value: 'mido26102002@gmail.com', onPressed: () {}),
              ProfileSettingMenu(title: 'Phone Number', value: '+84-036289211', onPressed: () {}),
              ProfileSettingMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileSettingMenu(title: 'Date of Birth', value: '26 Oct 2002', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems), 


              Center(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Log Out',
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