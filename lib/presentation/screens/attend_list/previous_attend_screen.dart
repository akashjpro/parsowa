import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list/widgets/attend_list_widget.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

import 'data/attebd_list_data.dart';

class PreviousAttendScreen extends StatefulWidget {
  static const String routeName = "/PreviousAttendScreen";

  const PreviousAttendScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PreviousAttendState();
  }
}

class PreviousAttendState extends State<PreviousAttendScreen> {
  List<AttendList> data = AttendList.init_data();
  late DateTime date;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = _getCurrentDate();
  }

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
            child: Column(
          children: [
            AttendListWidget.searchSection(date),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: _buildRecordList(context),
              ),
            ),
          ],
        )));
  }

  _buildRecordList(BuildContext context) {
    return data
        .map((item) => AttendListWidget.buildAttendItem(context, item, 4))
        .toList();
  }

  static _getCurrentDate() {
    var now = DateTime.now();
    return now;
  }
}
