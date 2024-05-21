import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:waflo_admin/features/authentication/screens/onboarding/onboarding.dart';
import 'package:waflo_admin/utils/theme/theme.dart';

void main() {

  // Todo: Add widgets Binding
  // Todo: Init Local Storage
  // Todo: Await Native Splash
  // Todo: Initialize Authentication
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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