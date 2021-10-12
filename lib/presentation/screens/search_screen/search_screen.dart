import 'package:flutter/material.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import '../../../core/constants/strings.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "/SearchScreen";

  const SearchScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.searchScreenName,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
