
import 'package:get/get.dart';
import 'package:waflo_admin/data/repositories/categories/category_repository.dart';
import 'package:waflo_admin/data/services/dummy_data.dart';
import 'package:waflo_admin/features/shop/models/category_model.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class UploadDataController extends GetxController {
  static UploadDataController get instance => Get.find();


    final categoryRepository = Get.put(CategoryRepository());

    void uploadCategoriesToFirebase() async {
    try {

        
      // Lấy danh sách các categories từ dummy_data.dart
      List<CategoryModel> categories = DummyData.categories;

      // Gọi hàm uploadDummyData từ CategoryRepository để tải dữ liệu lên Firebase
      await categoryRepository.uploadDummyData(categories);

      // Hiển thị thông báo thành công cho người dùng
      TLoaders.successSnackBar(title: 'Success', message: 'Your Categories have been uploaded successfully');

    } catch (e) {
      // Nếu có lỗi, hiển thị thông báo lỗi cho người dùng
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
    }
  }

}