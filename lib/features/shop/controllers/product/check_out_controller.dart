import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/list_titles/payment_tile.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';
import 'package:waflo_admin/features/shop/models/payment_method_model.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find<CheckoutController>();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit(){
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeadingBar(title: 'Select Payment Method', showActionButton: true),
              const SizedBox(height: TSizes.spaceBtwSections),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: TImages.paypal)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: TImages.creditCard)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: TImages.googlePay)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: TImages.applePay)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: TImages.visa)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'MasterCard', image: TImages.masterCard)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: TImages.paystack)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: TImages.paytm)),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const SizedBox(height: TSizes.spaceBtwSections),

              

            ],
          )
        ),
      ),
    );
  }
}