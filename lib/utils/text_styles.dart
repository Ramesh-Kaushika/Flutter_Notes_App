import 'package:flutter/material.dart';
import 'package:notes_app/utils/colors.dart';

class AppTextStyles {
  //title style
  static const TextStyle appTitle = TextStyle(
    fontSize: 28,
    color: AppColors.kWhiteCardColor,
    fontWeight: FontWeight.bold,
  );

  //subtitle style
  static const TextStyle subTitle = TextStyle(
    fontSize: 24,
    color: AppColors.kWhiteCardColor,
    fontWeight: FontWeight.w500,
  );

  //description large style
  static const TextStyle descriptionLargeStyle = TextStyle(
    fontSize: 20,
    color: AppColors.kWhiteCardColor,
    fontWeight: FontWeight.w400,
  );

  //description small style
  static const TextStyle descriptionSmallStyle = TextStyle(
    fontSize: 14,
    color: AppColors.kWhiteCardColor,
    fontWeight: FontWeight.w400,
  );

  //app Body
  static const TextStyle appBody = TextStyle(
    fontSize: 14,
    color: AppColors.kWhiteCardColor,
  );

  //app Button
  static const TextStyle appButton = TextStyle(
    fontSize: 16,
    color: AppColors.kWhiteCardColor,
    fontWeight: FontWeight.bold,
  );
}
