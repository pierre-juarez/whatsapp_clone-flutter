import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/constants/colors.dart';

ThemeData darkTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(),
      scaffoldBackgroundColor: AppColors.BACKGROUND_DARK,
      extensions: [CustomThemeExtension.darkMode],
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.PRIMARY_DARK,
          foregroundColor: AppColors.BACKGROUND_DARK,
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ));
}
