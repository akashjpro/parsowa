import 'package:flutter/material.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import '../../../core/constants/strings.dart';

class MakeJobRecordScreen extends StatelessWidget {
  static const String routeName = "/MakeJobRecordScreen";

  const MakeJobRecordScreen({Key? key, required this.title}) : super(key: key);

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
              Strings.jobRecordScreenName,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
