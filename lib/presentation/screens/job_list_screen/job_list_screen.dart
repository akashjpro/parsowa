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
            color: Colors.black,
            fontFamily: 'NotoSansJP-Bold.otf',
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: btn_back_appbar(),
        actions: [btn_close_appbar()],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bottom_of_appbar(),
            hashtag_list(category: category),
          ],
        ),
      ),
    );
  }

  Widget btn_close_appbar() {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/icon_svg/close_btn.svg',
        fit: BoxFit.contain,
        color: Colors.black,
        width: 22,
        height: 22,
      ),
    );
  }

  Widget btn_back_appbar() {
    return IconButton(
      onPressed: () {
        print('back');
      },
      icon: SvgPicture.asset(
        'assets/icons/icon_svg/back_btn.svg',
        fit: BoxFit.contain,
        color: Colors.black,
        width: 22,
        height: 22,
      ),
    );
  }
}
