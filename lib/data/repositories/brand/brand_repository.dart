import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/models/brand_model.dart';
import 'package:waflo_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:waflo_admin/utils/exceptions/firebase_storage_service.dart';
import 'package:waflo_admin/utils/exceptions/format_exceptions.dart';
import 'package:waflo_admin/utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables

  final _db = FirebaseFirestore.instance;
  
  // Get all categories

  Future<List<BrandModel>> getAllBrands() async{
    try {
      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
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

        // Upload brand data for featured brands
  Future<void> uploadBrandData(BrandModel brand) async {
    try {
      // Upload image
      final storage = Get.put(TFirebaseStorageService());
      final imageData = await storage.getImageDataFromAssets(brand.image);
      final imageUrl = await  storage.uploadImageData('brands/${brand.id}', imageData, brand.id);

      // Update brand model with imageUrl
      brand.image = imageUrl;

      // Save brand data to Firestore
      await _db.collection('Brands').doc(brand.id).set(brand.toJson());
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

  // Get brand for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async{
    try {

      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;

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
}