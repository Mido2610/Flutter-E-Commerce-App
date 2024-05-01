import 'package:flutter/material.dart';
import 'package:waflo_admin/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:waflo_admin/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:waflo_admin/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:waflo_admin/utils/theme/custom_themes/text_field_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevated_buttons_theme.dart';
import 'custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonsTheme.lightElevatetdButtonTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutLineButtonTheme.lightOutLineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonsTheme.darkElevatetdButtonTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutLineButtonTheme.darkOutLineButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}