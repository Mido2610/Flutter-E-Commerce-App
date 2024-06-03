import 'package:flutter/material.dart';
import 'package:waflo_admin/features/shop/screens/order/widgets/order_list_item.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -Appbabr
      appBar: TAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        child: OrderListItem()
      ),
      
    );
  }

}