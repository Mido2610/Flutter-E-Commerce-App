import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/controllers/product/variation_controller.dart';
import 'package:waflo_admin/utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
