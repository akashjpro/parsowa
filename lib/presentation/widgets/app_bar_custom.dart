import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget btnBackAppbar(Function() onPress) {
  return IconButton(
    onPressed: onPress,
    icon: SvgPicture.asset(
      'assets/icons/icon_svg/back_btn.svg',
      fit: BoxFit.contain,
      color: Colors.black,
      width: 22,
      height: 22,
    ),
  );
}

Widget btnCloseAppbar(Function() onPress) {
  return IconButton(
    onPressed: onPress,
    icon: SvgPicture.asset(
      'assets/icons/icon_svg/close_btn.svg',
      fit: BoxFit.contain,
      color: Colors.black,
      width: 22,
      height: 22,
    ),
  );
}

class AppBarCustom extends AppBar {
  final String stringTitle;
  final bool isLeadingHide;
  final bool isActionHide;

  AppBarCustom(
      {required this.stringTitle,
      required this.isLeadingHide,
      required this.isActionHide,
      required Function() onBackPress,
      required Function() onClosePress,
      Key? key})
      : super(
          key: key,
          title: Text(
            stringTitle,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSanJP',
                fontSize: 22,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          elevation: 1.0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading:  isLeadingHide ? null : btnBackAppbar(onBackPress) ,
          actions: isActionHide ? [] : [btnCloseAppbar(onClosePress)],
        );
}
