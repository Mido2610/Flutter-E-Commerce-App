import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/common/widgets/loaders/circular_loader.dart';
import 'package:waflo_admin/data/repositories/address/address_repository.dart';
import 'package:waflo_admin/features/personalization/model/address_model.dart';
import 'package:waflo_admin/utils/constants/images_strings.dart';
import 'package:waflo_admin/utils/helpers/network_manager.dart';
import 'package:waflo_admin/utils/popups/full_screen_loader.dart';
import 'package:waflo_admin/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());
  

  // Fetch all user specific address
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere((element) =>  element.selectedAddress, orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      return [];
    }
  }
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TCircularLoader(),
      );

      // Clear the 'selected' field
      if(selectedAddress.value.id.isNotEmpty){
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }
      // Assign selected addresss
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set selected field to true
      await addressRepository.updateSelectedField(newSelectedAddress.id, true); 
      Get.back();

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error in selecting', message: e.toString());
    }
  }

  // Add new address
  Future addNewAddresses() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Storing Address...', TImages.docerAnimation);
      
      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      } 
      // Form Validation
      if(!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Save address
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true
      );
      final id = await addressRepository.addAddress(address);
      // Update selected address status
      address.id = id;
      await selectAddress(address);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Success', message: 'Address added successfully');
      // Referesh address data
      refreshData.toggle();
      // Reset field
      resetFormFields();
      //Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address Not Found', message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}