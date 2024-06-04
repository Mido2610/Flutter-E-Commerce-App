import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class TFirebaseStorageService extends GetxController{
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  // Upload Local Assets from IDE
  // Return a Uin8List containing image data
  
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      // Handle exceptions gracefully
      throw 'Error loading image data: $e';
    }
  }

  // Upload Image using ImageData on Cloud Firebase Storage
  // Returns the dowload URL of the uploaded Image.

  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      // Handle exceptions gracefully
      if(e is FirebaseException){
        throw 'Firebase Exception: ${e.message}';
      } else if(e is SocketException){
        throw 'Network Error: ${e.message}';
      } else if(e is PlatformException){
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something went wrong. Please try again.';
      }
    }
  }

  // In your ImageUploadService


  // Upload Image on Cloud Firebase Storage
  // Returns the dowload URL of the uploaded Image.
  Future<String> uploadImageFile(String path, String assetPath) async {
    try {
      final byteData = await rootBundle.load(assetPath);
      final imageData = byteData.buffer.asUint8List();
      final ref = _firebaseStorage.ref(path).child(assetPath.split('/').last);
      await ref.putData(imageData);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something went wrong. Please try again.';
      }
    }
  }
}
