import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/banners/banner_repository.dart';
import 'package:waflo_admin/data/services/dummy_data.dart';
import 'package:waflo_admin/features/shop/models/banner_model.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final BannerRepository _bannerRepository = Get.put(BannerRepository());


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update Page Navigational Dots
  void updatePageIndicator(int index) { 
    carousalCurrentIndex.value = index;
  }

  // Fetch Banners
  Future<void> fetchBanners() async {
    try{
      // Show loader while loading categories
      isLoading.value = true;

      //Fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners  = await bannerRepo.fetchBanners();

      // Assign banner
      this.banners.assignAll(banners);
      

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader 
      isLoading.value = false;
    }
  }
  Future<void> uploadData() async {
    try {
      isLoading.value = true;
      for (BannerModel banner in DummyData.banners) {
        try {
          await _bannerRepository.uploadBanner(banner);
        } catch (e) {
          if (e.toString().contains('Banner with the same image and target screen already exists.')) {
            TLoaders.errorSnackBar(title: 'Duplicate Banner', message: e.toString());
          } else {
            throw '$e';
          }
        }
      }
      TLoaders.successSnackBar(title: 'Success', message: 'Banners uploaded successfully');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

