import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waflo_admin/bindings/general_binding.dart';
import 'package:waflo_admin/routes/app_routes.dart';
import 'package:waflo_admin/utils/constants/colors.dart';
import 'package:waflo_admin/utils/constants/text_strings.dart';
import 'package:waflo_admin/utils/device/web_master_scroll.dart';
import 'package:waflo_admin/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBinding(),
      scrollBehavior: MyCustomScrollBehavior(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white)
        )
      )
    );
  }
}