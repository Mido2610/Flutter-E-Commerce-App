import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/categories/category_repository.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/utils/popups/full_screen_loader.dart';
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
}