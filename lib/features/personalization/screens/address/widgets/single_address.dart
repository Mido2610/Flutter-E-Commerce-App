import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waflo_admin/features/personalization/controllers/address_controller.dart';
import 'package:waflo_admin/features/personalization/model/address_model.dart';
import 'package:waflo_admin/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key,
    required this.address,
    required this.onTap,
    this.onDelete,
  });

  final AddressModel address;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: RoundedContainer(
          width: double.infinity,
          showBorder: true,
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
          borderColor: selectedAddress ? Colors.transparent : dark ? TColors.darkerGrey : TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Row(
                  children: [
                    if (selectedAddress)
                      Icon(
                        Iconsax.tick_circle5,
                        color: dark ? TColors.light : TColors.dark,
                      ),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    IconButton(
                      icon: const Icon(Iconsax.trash, color: TColors.error),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(address.toString(), softWrap: true),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
