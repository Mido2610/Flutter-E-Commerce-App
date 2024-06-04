import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/brand/brand_repository.dart';
import 'package:waflo_admin/data/repositories/product/product_repository.dart';
import 'package:waflo_admin/features/shop/models/brand_model.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  // -- Load Brands
  Future<void> getFeaturedBrands() async {
     try {

      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands .assignAll(brands);

      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(3));


     } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
     } finally {
      isLoading.value = false;
     }
  }
  // Get Brand for category
    Future<List<BrandModel>> getBrandForCategory(String categoryId) async{
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }

  // Get Brand Specific products from your data source
  Future<List<ProductModel>> getBrandProducts ({required String brandId, int limit = -1}) async{
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }
}