import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waflo_admin/data/repositories/authentication_repostiory.dart';
import 'package:waflo_admin/features/personalization/controllers/user_controller.dart';
import 'package:waflo_admin/utils/popups/full_screen_loader.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/helpers/network_manager.dart';


class LoginController extends GetxController{

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  @override
  void onInit(){
    email.text =  localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text =  localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // -- Email and Password login
  Future<void> emailAndPasswordSignIn() async{
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Sava data if remember me is checked
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } 

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassWord(email.text.trim(), password.text.trim());

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Redict
      AuthenticationRepository.instance.screenRedirect();    
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }


  // -- Google Sign In Authentication
  Future<void> googleSignIn() async{
    try {
      
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      } 

      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}