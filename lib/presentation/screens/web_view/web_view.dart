import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  static const String routeName = "/WebViewScreen";

  final String title;

  const WebViewScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: title,
          isLeadingHide: false,
          isActionHide: true,
          onBackPress: () => {Navigator.of(context).pop()},
          onClosePress: () => {}),
      body: const WebView(
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
    );
  }
}
