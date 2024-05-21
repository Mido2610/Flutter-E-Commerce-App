import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/onboarding.dart';
import 'package:waflo_admin/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}