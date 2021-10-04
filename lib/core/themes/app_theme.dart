import 'package:flutter/material.dart';
import 'package:parsowa/core/colors/app_material_color.dart';


class AppTheme {
  const AppTheme._();
  static final lightTheme = ThemeData(
    primarySwatch: AppMaterialColor.primaryColorOfLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primarySwatch: AppMaterialColor.primaryColorOfLight,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
