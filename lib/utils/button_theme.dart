
import 'package:flutter/material.dart';

import 'color.dart';

class TButtonTheme {
  static final ElevatedButtonThemeData elevatedButtonTheme =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColor.whiteColor,
      backgroundColor: AppColor.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.red,
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final OutlinedButtonThemeData outlinedButtonTheme =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor:  AppColor.primary,
      backgroundColor: AppColor.whiteColor,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.red,
      side: const BorderSide(color:AppColor.primary ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
          fontSize: 16,
          color: AppColor.whiteColor,
          fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
