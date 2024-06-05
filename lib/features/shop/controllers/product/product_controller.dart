import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/product/product_repository.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/utils/constants/enums.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while loading Products
      isLoading.value = true;

      // Fetch Products from data source(Firestore, API, etc,..)
      final products = await productRepository.getfeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {

      // Fetch Products from data source(Firestore, API, etc,..)
      final products = await productRepository.getAllfeaturedProducts();
      return products;

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    } 
  }
  // Upload Product to the database
  uploadProductToFireBase(List<ProductModel> products) async {
    try {
      isLoading.value = true;
      await productRepository.uploadDummyData(products);
      TLoaders.successSnackBar(title: 'Success', message: 'Products uploaded successfully');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get the product price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variantions exit, return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      // Calculate the smallese and largest prices among variantions
      for (var variation in product.productVariations!) {
        // Determine the price to consinder (sale price if available, otherwise regurlar price)

        double pricetoConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest price
        if (pricetoConsider < smallestPrice) {
          smallestPrice = pricetoConsider;
        }
        if (pricetoConsider > largestPrice) {
          largestPrice = pricetoConsider;
        }
      }
       // If smallest and largest price are the same, return a single price
       if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
       } else {
        // Otherwise, return a price range
        return '$smallestPrice - $largestPrice';
       }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // --Check Products Stock Status
  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
