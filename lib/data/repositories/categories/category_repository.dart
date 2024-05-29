
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:waflo_admin/utils/exceptions/firebase_storage_service.dart';
import 'package:waflo_admin/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Upoad Categories to the Cloud Firebase

  Future<void> uploadDummyData(List<CategoryModel> categories) async{
    try {
      // Upload all the categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      // Loop throught each catorgy
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload the image and get its url
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to category image attribute
        category.image = url;

        // Store category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch(e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}