import 'package:flutter/material.dart';

class AppColors {
  //primary colors
  static const Color pBgColor = Color(0xff202326);
  static const Color kFabColor = Color.fromARGB(255, 204, 17, 237);
  static const Color kCardColor = Color(0xff2f3225);
  static const Color kWhiteCardColor = Colors.white;

  //gradiant colors
  static const int gradiantStart = 0XFF01F0FF;
  static const int gradiantEnd = 0XFF4441ED;

  LinearGradient kPrimaryGradiant = const LinearGradient(
    colors: [
      Color(gradiantStart),
      Color(gradiantEnd),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
