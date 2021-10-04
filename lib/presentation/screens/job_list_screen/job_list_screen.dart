import 'package:flutter/material.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import 'widgets/bottom_of_appbar.dart';
import 'widgets/hashtag_list.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  List<String> category = [
    '午前中',
    '午後',
    '身体',
    '身体・生活',
    '身体・生活 身体・生活 身体・生活',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(widget.title, () => {}, () => {}),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const bottom_of_appbar(),
            hashtag_list(category: category),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
