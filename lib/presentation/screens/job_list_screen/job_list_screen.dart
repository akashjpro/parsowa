import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/strings.dart';
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
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xff2c2c2c),
            fontFamily: 'NotoSanJP',
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: btnBackAppbar(),
        actions: [btnCloseAppbar()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          bottom_of_appbar(),
          hashtag_list(category: category),
        ],
      ),
    );
  }

  Widget btnCloseAppbar() {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/icon_svg/close_btn.svg',
        fit: BoxFit.contain,
        color: Color(0xff2c2c2c),
        width: 22,
        height: 22,
      ),
    );
  }

  Widget btnBackAppbar() {
    return IconButton(
      onPressed: () {
        print('back');
      },
      icon: SvgPicture.asset(
        'assets/icons/icon_svg/back_btn.svg',
        fit: BoxFit.contain,
        color: Color(0xff2c2c2c),
        width: 22,
        height: 22,
      ),
    );
  }
}
