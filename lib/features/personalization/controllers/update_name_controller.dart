import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/user/user_repository.dart';
import 'package:waflo_admin/features/personalization/controllers/user_controller.dart';
import 'package:waflo_admin/features/personalization/screens/profile_setting/profile_setting.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/helpers/network_manager.dart';
import 'package:waflo_admin/utils/popups/full_screen_loader.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController instance = Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Init user data when Home Screen appeared
  @override
  void onInit() {
    intializeNames();
    super.onInit();
  }
  

  //Fetch user record
  Future<void> intializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async{
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('Updating your name...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's fisrt & last name in the database
      Map<String,dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};


      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader 
      TFullScreenLoader.stopLoading();

      // Show a success message
      TLoaders.successSnackBar(title: 'Success', message: 'Your name has been updated successfully');

      // Move to previous screen
      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: 'An error occured while updating your name');
    }
  }
}