import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'NotoSanJP',
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        height: 1.75,
      ),
    );
  }
}
