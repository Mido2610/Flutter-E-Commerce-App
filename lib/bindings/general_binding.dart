import 'package:get/get.dart';
import 'package:waflo_admin/features/personalization/controllers/address_controller.dart';
import 'package:waflo_admin/features/shop/controllers/banner_controller.dart';
import 'package:waflo_admin/features/shop/controllers/brand_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/check_out_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/product_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/variation_controller.dart';
import 'package:waflo_admin/utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
    Get.put(BrandController());
    Get.put(ProductController());
    Get.put(BannerController());
  }
}
