import 'package:get/get.dart';
import 'package:waflo_admin/features/shop/controllers/product/cart_controller.dart';
import 'package:waflo_admin/features/shop/controllers/product/images_controller.dart';
import 'package:waflo_admin/features/shop/models/product_model.dart';
import 'package:waflo_admin/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  // Variables 
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;

  // --Seleceted  Attributes and Variation
  void onAttributeSelected(ProductModel product, attributeName, attributeValue) {
    
    // When attribute is selected we will first add that attribute to the selecetedAttributes
    final selectedAttributes = Map<String,dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName]= attributeValue; 

    final selectedVariation = product.productVariations!.firstWhere(
      (varation) => _isSameAttributeValues(varation.attributeValues, selectedAttributes), 
      orElse: (() => ProductVariationModel.empty()));

    // Show the selected Variation images as a Main Image
    if(selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedProductImage.value = selectedVariation.image;
    }

    // Show selected variation quantity already in the cart
    if(selectedVariation.id.isNotEmpty){
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }

    // Assign selected Variation
    this.selectedVariation.value = selectedVariation;

    // Update selected product variation status
    getProductVariationStockStatus();
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    // If the number of selected attributes is not equal to the number of variation attributes
    if(variationAttributes.length != selectedAttributes.length) return false;

    // If any of the attributes is different then return, e.g, [Green, Large] x [Green, Small]
    for(final key in variationAttributes.keys){
      // Attributes[key] = which could be [Green, Small, Cotton] etc.
      if(variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  // Check Attribute availability/ stock in variation
  Set<String?> getAttributeAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    // Pass the variation to check with attributes are available and stock is not 0
     final availableVariationAttributeValues = variations
     .where((variation) => 
      // Check empty / Out of stock available
        variation.attributeValues[attributeName] != null && variation.attributeValues[attributeName]!.isNotEmpty && variation.stock > 0)
      // Fetch all non - empty attributes of variations
      .map((variations) => variations.attributeValues[attributeName])
     .toSet();

    return availableVariationAttributeValues;
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  // - Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Reset Selected attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = ''; 
    selectedVariation.value  = ProductVariationModel.empty();
  }
}