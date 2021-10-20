import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list/widgets/attend_list_widget.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import 'data/attebd_list_data.dart';

class RecordScreen extends StatefulWidget {
  static const String routeName = "/RecordScreen";

  const RecordScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecordState();
  }
}

class RecordState extends State<RecordScreen> {
  List<AttendList> data = AttendList.init_data();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.jobListBodyColor,
      appBar: AppBarCustom(
          stringTitle: widget.title,
          isLeadingHide: true,
          isActionHide: true,
          onBackPress: () => {},
          onClosePress: () => {}),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: ListView(
            children: _buildRecordList(context),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }

  _buildRecordList(BuildContext context) {
    return data
        .map((item) => AttendListWidget.buildAttendItem(context, item, 3))
        .toList();
  }
}
