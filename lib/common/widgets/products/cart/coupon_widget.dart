import 'package:flutter/material.dart';
import 'package:waflo_admin/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../containers/rounded_container.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, left: TSizes.md, right: TSizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nhập mã giảm giá',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,  
                disabledBorder: InputBorder.none,

              )
            ),
          ),
          // Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){},
              child: const Text('Áp dụng'),
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: TColors.grey.withOpacity(0.1)),
                primary: Colors.grey.withOpacity(0.3),
                onPrimary: dark ? TColors.white.withOpacity(0.5) : TColors.dark.withOpacity(0.5),
              )
            ),
          ),
        ],
      ),
    );
  }
}