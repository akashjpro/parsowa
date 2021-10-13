import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/job_list/widgets/job_list_widget.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import 'data/job_list_data.dart';
import 'widgets/bottom_of_appbar.dart';
import 'widgets/hashtag_list.dart';

class JobListScreen extends StatefulWidget {
  static const String routeName = "/JobListScreen";

  JobListScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final data = JobData.initData();
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
      appBar: AppBarCustom(
          stringTitle: widget.title,
          isLeadingHide: true,
          isActionHide: true,
          onBackPress: () => {},
          onClosePress: () => {}),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Color(0xffFFFFFF),
            child: BottomOfAppbar(),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 14),
            color: Color(0xffFFFFFF),
            child: HashTagList(category: category),
          ),
          JobListBodyWidget(
            data: widget.data,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}