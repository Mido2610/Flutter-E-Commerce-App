import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:waflo_admin/features/authentication/screens/login/login.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/onboarding.dart';

import '../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show Relevant screen

  screenRedirect() async {
    //Local storage
    deviceStorage.writeIfNull('IsFirstTimee', true);
    deviceStorage.read('IsFirstTimee') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }

  // ----------------------------------------- email & password login --------------------------------------------------

  /// [Email Authentication] - SignIn

  /// [Email Authentication] - Register

  Future<UserCredential> registerWithEmailAndPassWord(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [Email Authentication] - Forgot Password

  /// [Email Verification] - Verify Email

  /// [ReAuthentication] - ReAuthenticate User
}
