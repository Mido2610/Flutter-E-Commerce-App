import 'dart:convert';

import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/product/product_repository.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/utils/local_storage/storage_utility.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  // Variables
  final favourites = <String, bool>{}.obs;

  @override
  void onInit(){
    initFavourites();
    super.onInit();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData('favourites');
    if(json != null ){
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId){
    return favourites[productId] ?? false;
  }

void toggleFavouriteProduct(String productId) {
    if (favourites.containsKey(productId) && favourites[productId] == true) {
        // Nếu sản phẩm đã có trong danh sách yêu thích và đang được đánh dấu là yêu thích,
        // thì xóa sản phẩm khỏi danh sách yêu thích
        favourites[productId] = false;
        TLocalStorage.instance().removeData(productId);
        favourites.remove(productId);
        TLoaders.customToast(message: 'Product has been removed from your favourites');
    } else {
        // Nếu sản phẩm không có trong danh sách yêu thích hoặc đang không được đánh dấu là yêu thích,
        // thì thêm sản phẩm vào danh sách yêu thích
        favourites[productId] = true;
        TLoaders.customToast(message: 'Product has been added to the Wishlist');
    }
    saveFavouritesToStorage();
    favourites.refresh();
}

  void saveFavouritesToStorage() {
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance().writeData('favourites', encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    if (favourites.isEmpty) return [];
    return await ProductRepository.instance.getFavouriteProducts(favourites.keys.toList());
  }
}