import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  static const String routeName = "/ContactUsScreen";

  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBarCustom(
    stringTitle: Strings.contactUsTitle,
    isLeadingHide: false,
    isActionHide: true,
    onBackPress: () => {Navigator.of(context).pop()},
    onClosePress: () => {}),
      body:const WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
