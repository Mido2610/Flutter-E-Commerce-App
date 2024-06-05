import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/utils/constants/enums.dart';
import 'package:waflo_admin/utils/exceptions/firebase_exceptions.dart';
import 'package:waflo_admin/utils/exceptions/firebase_storage_service.dart';
import 'package:waflo_admin/utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {

  static ProductRepository get instance => Get.find();

  // Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getfeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  Future<List<ProductModel>> getAllfeaturedProducts() async{
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async{
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList= querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<List<ProductModel>> getFavouriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

    Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async{
    try {
      final querySnapshot = limit == -1 
        ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get() 
        : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();
    
      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList(); 
      return products;      
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
    Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async{
    try {
      QuerySnapshot productCategoryQuery = limit == -1 
        ? await _db.collection('ProductsCategory').where('categoryId', isEqualTo: categoryId).get() 
        : await _db.collection('ProductsCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      List<String> productsIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productsIds).get();
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;  
      
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    }  on PlatformException catch (e) {
      throw TPlatformException(e.code).message; 
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Upload dummy data to the cloud firestore
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all  the products along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get ImageData link from the local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload the image and get its url
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if(product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrls = [];
          for (var image in product.images!) {
            // Get ImageData link from the local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload the image and get its url
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imagesUrls.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrls);
        }

        // Upload Variation Images
        if(product.productType == ProductType.variable.toString() )   {
          for(var variation in product.productVariations!) {
            // Get ImageData link from the local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload the image and get its url
            final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);

            // Assign URL to product.thumbnail attribute
            variation.image = url;
          }
        }

        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

}