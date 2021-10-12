import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list_screen/data/attebd_list_data.dart';
import 'package:parsowa/presentation/screens/attend_list_screen/widgets/attend_list_widget.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

import '../../../core/constants/strings.dart';

class AttendListScreen extends StatefulWidget {
  const AttendListScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AttendListScreenState();
  }
}

class AttendListScreenState extends State<AttendListScreen>
    with TickerProviderStateMixin {
  late final date;
  final List<AttendList> data = AttendList.init_data();
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    date = _getCurrentDate();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.jobListBodyColor,
        appBar: AppBarCustom(
            stringTitle: widget.title,
            isLeadingHide: true,
            isActionHide: true,
            onBackPress: () => {},
            onClosePress: () => {}),
        body: Column(
          children: <Widget>[
            AttendListWidget.searchSection(date),
            Container(
              color: AppColors.whiteColor,
              height: 10,
            ),
            _buildTabbar(context),
            const SizedBox(height: 10),
            Expanded(child: _buildTabView(context))
          ],
        ));
  }

  _buildAttendList(BuildContext context) {
    var _attendList =
        data.where((element) => element.status.compareTo('修正済') == 0).toList();
    return _attendList
        .map((item) => AttendListWidget.buildAttendItem(context, item, 1))
        .toList();
  }

  _buildRequestingRevision(BuildContext context) {
    var _requestRevisonList = data
        .where((element) => element.status.compareTo('修正依頼中') == 0)
        .toList();
    return _requestRevisonList
        .map((item) => AttendListWidget.buildAttendItem(context, item, 2))
        .toList();
  }

  _buildTabView(BuildContext context) => TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: _buildAttendList(context),
          ),
          ListView(
            children: _buildRequestingRevision(context),
          ),
        ],
      );
  _buildTabbar(BuildContext context) => Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border(
              top: BorderSide(
                  width: 1, color: const Color(0xff707070).withOpacity(0.2)),
            )),
        child: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(
              color: AppColors.jobListBodyColor,
              border: Border(
                top: BorderSide(width: 4, color: AppColors.primaryColor),
              )),
          labelColor: AppColors.unselectedColor,
          unselectedLabelColor: AppColors.primaryColor,
          labelStyle: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 18.0,
              color: AppColors.unselectedColor,
              fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 18.0,
              fontWeight: FontWeight.w400),
          tabs: const [
            Tab(
              text: '出退勤',
            ),
            Tab(
              text: '修正依頼中',
            ),
          ],
        ),
      );
  static _getCurrentDate() {
    var now = DateTime.now();
    return now;
  }

  _addDate(DateTime date) {
    var newDate = DateTime(date.year, date.month, date.day + 1);
    setState(() {
      date = newDate;
    });
  }
}
