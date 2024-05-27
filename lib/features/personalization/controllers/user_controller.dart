import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

import '../../../data/repositories/user_repository.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController{

  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if(userCredentials != null){
        // Covert name to first and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUserName(userCredentials.user!.displayName ?? '');

        // Map data
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username, 
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

          // Save user data
          await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information. You can re-save your data in your Profile',
      );
    }
  }
}