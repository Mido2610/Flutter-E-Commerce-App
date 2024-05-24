import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/images_strings.dart';

/// A circular loader widget with customizable foreground and background colors.
class TLoaderAnimation extends StatelessWidget {
  const TLoaderAnimation({
    Key? key,
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(TImages.defaultLoaderAnimation, height: 200, width: 200));
  }
}