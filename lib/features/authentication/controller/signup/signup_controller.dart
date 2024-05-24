import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/authentication_repostiory.dart';
import 'package:waflo_admin/data/repositories/user_repository.dart';
import 'package:waflo_admin/features/authentication/screens/signup/verify_email.dart';
import 'package:waflo_admin/utils/popups/full_screen_loader.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final hidePassword = true.obs; // Obx variable for password visibility
  final privayPolicy = true.obs; // Obx variable for privacy policy checkbox
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final firstName = TextEditingController(); // Controller for first name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for validation

  // --SIGNUP

  void signUp() async {
    try {
      //Start Loading

      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.docerAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation

      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privayPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In Order To Continue You Must Accept The Privacy Policy');
        return;
      }

      // Register user in the Firebase  Authentication & Save user data in the firebase

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassWord(
              email.text.trim(), password.text.trim());

      // Save Authenticated userdata in the Firebase storage
      final newUSer = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUSer);

      // show sucess message

      TLoaders.successSnackBar(
          title: 'Congratulations!',
          message:
              'Your account has been created! Please check your email for verification.');

      // Move to Verity email address
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());

      //Remove loader
      TFullScreenLoader.stopLoading();

      //show some generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
