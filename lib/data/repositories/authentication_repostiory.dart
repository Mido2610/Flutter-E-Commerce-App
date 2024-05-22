import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waflo_admin/features/authentication/screens/login/login.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variable
  final deviceStorage = GetStorage();

  // Called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant screen

  screenRedirect() async {
    //Local storage
    if(kDebugMode){

      print('================= GET STORAGE Auth Repo ==================');
      print(deviceStorage.read('IsFirstTimee'));
    }

    deviceStorage.writeIfNull('IsFirstTimee', true);
    deviceStorage.read('IsFirstTimee') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }

  // ----------------------------------------- email & password login ---------------------------------------------------
}
