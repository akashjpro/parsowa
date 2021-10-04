import 'package:flutter/material.dart';
import 'package:parsowa/core/common/utils.dart';
import 'package:parsowa/core/constants/colors.dart';

extension AppMaterialColor on ColorScheme {
  static MaterialColor get primaryColorOfLight =>
      createMaterialColor(AppColors.primaryColor);
}
