import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 10 : 10,
      width: isActive ? 10 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.whiteColor,
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}