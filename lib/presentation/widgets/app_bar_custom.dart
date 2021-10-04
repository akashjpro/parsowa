import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarCustom extends AppBar {
  final String stringTitle;

  AppBarCustom(
      this.stringTitle, Function() onBackPress, Function() onClosePress,
      {Key? key})
      : super(
          key: key,
          title: Text(
            stringTitle,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'NotoSansJP-Bold.otf',
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: btnBackAppbar(onBackPress),
          actions: [btnCloseAppbar(onClosePress)],
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
