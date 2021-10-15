import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/make_job_record/make_job_record.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import '../../../core/constants/strings.dart';

class MakeJobRecordScreen extends StatelessWidget {
  static const String routeName = "/MakeJobRecordScreen";

  const MakeJobRecordScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: Strings.contactUsTitle,
          isLeadingHide: false,
          isActionHide: true,
          onBackPress: () => {Navigator.of(context).pop()},
          onClosePress: () => {}),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.jobRecordScreenName,
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MakeJobRecord(),
              )),
              child: const Text('Push to make job record'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
    );
  }
}
