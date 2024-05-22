import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //Variables
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final firstName = TextEditingController(); // Controller for first name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for validation 


  // --SIGNUP

  Future<void> signUp() async {
 {
      //Start Loading 
      


      //Check Internet Connectivity


      // Form Validation 


      // Privacy Policy Check


      // Register user in the Firebase  Authentication & Save user data in the firebase

      
      // show sucess message 



    }
    

  }
}
