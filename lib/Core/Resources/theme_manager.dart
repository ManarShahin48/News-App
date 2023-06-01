import 'package:flutter/material.dart';
import '../../Core/Resources/uilites.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    // appBarTheme: AppBarTheme(
    //     centerTitle: true,
    //     color: ColorManager.primary,
    //     elevation: AppSize.s4,
    //     shadowColor: ColorManager.lightPrimary,
    //     titleTextStyle:
    //         getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)),
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primary),
    elevatedButtonTheme: ElevatedButtonThemeData()
  );
}
