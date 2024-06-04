
import 'package:cloud_firestore/cloud_firestore.dart';
class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  // Empty Helper Function
  static BrandModel empty() {
    return BrandModel(
      id: '',
      name: '',
      image: '',
    );
  }

  // Convert Model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductsCount': productsCount,
    };
  }

  // có thể giữ nguyên phương thức toJSon để hạn chế ảnh hưởng đến các tệp khác
  Map<String, dynamic> toJSon() {
    return toJson();
  }

  // Map Json oriented document snapshot from firebase to Usermodel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: data['ProductsCount'] ?? 0,
    );
  } 
  // Map Json oriented document snapshot from firebase to Usermodel
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) {
    if(document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the model
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productsCount: data['ProductsCount'] ?? 0,
      );
    }
    throw Exception('Invalid document snapshot'); // Add a throw statement to handle the case when the document is null.
  }
}