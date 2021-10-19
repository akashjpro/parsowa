import 'package:flutter/material.dart';

class CustomDescription extends StatelessWidget {
  final String description;
  const CustomDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontFamily: 'NotoSanJP',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    );
  }
}
