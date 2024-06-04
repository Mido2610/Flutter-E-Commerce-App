import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/categories/category_repository.dart';
import 'package:waflo_admin/data/repositories/product/product_repository.dart';
import 'package:waflo_admin/data/services/dummy_data.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit(){
    fetchCategories();
    super.onInit();
  }

  // --Load category data

  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categores
      isLoading.value = true;

      // Fetch categories from data source(Firestore, API, etc,..)
      final categories = await _categoryRepository.getAllCategories();

      //Update the categories list
      allCategories.assignAll(categories);

      //Filters featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove loader
      isLoading.value = false;
    }
  }
  
  // Upload dummy data for category
 
  Future<void> uploadCategory() async {
    try {
      isLoading.value = true;
        await _categoryRepository.uploadDummyData(DummyData.categories);
      TLoaders.successSnackBar(
          title: 'Success', message: 'All Categories uploaded successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  

  // Load selected category data
    Future<List<CategoryModel>> getSubCategory(String categoryId) async {
      try {
        final subCategories = await _categoryRepository.getSubCategories(categoryId);
        return subCategories;
      } catch (e) {
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
        return [];
      }

  }




  // Get Category or sub-category products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
    // Fetch limited (4) products against each subCategory
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
    return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }
}