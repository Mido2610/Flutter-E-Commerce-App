import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/common/widgets/custome_shapes/containers/primary_header_container.dart';
import 'package:waflo_admin/common/widgets/list_titles/setting_menu_tile.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/data/repositories/authentication/authentication_repostiory.dart';
import 'package:waflo_admin/features/personalization/screens/address/address.dart';
import 'package:waflo_admin/features/personalization/screens/profile_setting/profile_setting.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_titles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../order/order_screen.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // Header
          PrimaryHeaderContainer(
            child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // User Profile Card
                UserProfileTile(onPressed: () => Get.to(() => const ProfileSettingScreen())),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),

          // Body

          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                // Account Setting
                const SectionHeadingBar(
                  title: 'Account Setting',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                SettingMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subtitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                SettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove products and move to checkout',
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subtitle: 'In-progress and Completed orders',
                  onTap: () => Get.to(() => const OrderScreen()),
                ),
                SettingMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subtitle: 'Withdraw balance to registered bank account',
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subtitle: 'List of all the discount coupons',
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notification',
                  subtitle: 'Set any kind of notification message',
                  onTap: () {},
                ),
                SettingMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subtitle: 'Manage data usage and connected accounts',
                  onTap: () {},
                ),

                // -- App Setting
                const SizedBox(height: TSizes.spaceBtwSections),
                const SectionHeadingBar(
                    title: 'App Setting', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subtitle: 'Upload data to your Cloud Firebase'),
                SettingMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subtitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                SettingMenuTile(
                  icon: Iconsax.security_user,
                  title: 'Safe mode',
                  subtitle: 'Search result is safe for all ages',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                SettingMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subtitle: 'Set image quality to be seen',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),

                // Logout Button
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => AuthenticationRepository.instance.logout(),
                    child: const Text('Logout'),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections * 2.5),
              ],
            ),
          )
        ],
      ),
    ));
  }
}