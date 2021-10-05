import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/job_list_screen/data/job_list_data.dart';
import 'package:parsowa/presentation/screens/job_list_screen/widgets/job_list_widget.dart';

import '../../../core/constants/strings.dart';

class JobListScreen extends StatelessWidget {
  JobListScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  final data = JobData.initData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: const Color(0xffe9e9e9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.jobListScreenName,
              style: Theme.of(context).textTheme.headline4,
            ),
            JobListBodyWidget(
              data: data,
            )
          ],
        ),
      ),
    );
  }
}
