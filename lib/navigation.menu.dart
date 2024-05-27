import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/features/shop/screens/Store/store_screen.dart';
import 'package:waflo_admin/features/shop/screens/home/home.dart';
import 'package:waflo_admin/features/shop/screens/profile/profile_screen.dart';
import 'package:waflo_admin/utils/constants/colors.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

import 'features/shop/screens/Wishlist/wish_list.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key,});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigtaionController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          selectedIndex: controller.selectedIndex.value,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigtaionController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const CreateStoreScreen(),
    const CreateWishListSCreen(),
    const CreateProfileScreen(),
    Container(color: Colors.blue)
  ];
}
