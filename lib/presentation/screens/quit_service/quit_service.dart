import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class QuitServiceScreen extends StatelessWidget {
  static const String routeName = "/QuitServiceScreen";

  const QuitServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: "Quit Service",
          isLeadingHide: false,
          isActionHide: true,
          onBackPress: () => {Navigator.of(context).pop()},
          onClosePress: () => {}),
      body: Center(
        child: Text("Quit Service"),
      ),
    );
  }
}
