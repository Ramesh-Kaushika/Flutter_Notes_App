import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

class ThemeClass{

  static ThemeData darkTheme = ThemeData(
      primaryColor: ThemeData.dark().primaryColor,
      scaffoldBackgroundColor: AppColors.pBgColor,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: AppColors.kWhiteCardColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.pBgColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.kWhiteCardColor,
        )
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.kFabColor,
      ),
  );
}