import 'package:flutter/material.dart';
import 'package:waflo_admin/common/widgets/texts/section_heading.dart';

import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({
    super.key,
    
    });

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        SectionHeadingBar(title: 'Địa chỉ vận chuyển', buttonTitle: 'Thay đổi', onPressed: () {}),
        Text('Mido Shop', style: Theme.of(context).textTheme.bodyLarge),


        Row (
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('+84 0362737892', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        Row (
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Nguyễn Văn Công, Gò Vấp , Thành Phố Hồ Chí Minh', 
              style: Theme.of(context).textTheme.bodyMedium, 
              softWrap: true
            ),
          ],
        ),        
      ],

    );


  }
  
}