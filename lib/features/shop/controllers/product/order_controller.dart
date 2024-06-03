import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/sucess_screen/sucess_screen.dart';
import 'package:waflo_admin/data/repositories/authentication/authentication_repostiory.dart';
import 'package:waflo_admin/data/repositories/order/order_repository.dart';
import 'package:waflo_admin/features/personalization/controllers/address_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/cart_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/check_out_controller.dart';
import 'package:waflo_admin/features/shop/models/order_model.dart';
import 'package:waflo_admin/navigation.menu.dart';
import 'package:waflo_admin/utils/constants/enums.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/popups/full_screen_loader.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  // Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  } 

  // Add some method for order processing
  void processOrder(double totalAmount) async{
    try {
      // Start loader 
      TFullScreenLoader.openLoadingDialog('We are processing your order...', TImages.pencilAnimation);

      // Get user authentication id
      final userId = AuthenticationRepository.instance.authUser.uid;
      if (userId.isEmpty)  return;

      // add details 
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        //Set data as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to Firestore
      await orderRepository.saveOrder(order, userId);

      // Update the cart store
      cartController.clearCart();
      
      // show success message
      Get.offAll(() => SucessSreen(
        image: TImages.orderCompletedAnimation, 
        title: 'Payment Successful', 
        subTitle: 'Your item will be shipped soon', 
        onPressed: () => Get.offAll(() => const NavigationMenu()),
      ));    
    } catch (e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}