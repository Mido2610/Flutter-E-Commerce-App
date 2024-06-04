
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/models/banner_model.dart';
import 'package:waflo_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:waflo_admin/utils/exceptions/firebase_storage_service.dart';
import 'package:waflo_admin/utils/exceptions/format_exceptions.dart';
import 'package:waflo_admin/utils/exceptions/platform_exceptions.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;
  // Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  // Upload data to cloud firebase'

  Future<void> uploadBanner(BannerModel banner) async {
    try {
      // Check if the banner already exists
      final existingBanner = await _db
          .collection('Banners')
          .where('ImageUrl', isEqualTo: banner.imageUrl)
          .where('TargetScreen', isEqualTo: banner.targetScreen)
          .get();

      if (existingBanner.docs.isNotEmpty) {
        throw 'Banner with the same image and target screen already exists.';
      }

      final storage = Get.put(TFirebaseStorageService());
      // Upload the image to Firebase Storage and get the download URL
      final imageUrl = await storage.uploadImageFile('banners', banner.imageUrl);

      // Create a new BannerModel with the updated imageUrl
      final updatedBanner = BannerModel(
        imageUrl: imageUrl,
        targetScreen: banner.targetScreen,
        active: banner.active,
      );

      // Save the updated banner to Firestore
      await _db.collection('Banners').add(updatedBanner.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}