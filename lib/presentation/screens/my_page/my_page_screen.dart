import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list/previous_attend_screen.dart';
import 'package:parsowa/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:parsowa/presentation/screens/make_job_record/make_job_record_screen.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import '../../../core/constants/strings.dart';

class MyPageScreen extends StatelessWidget {
  static const String routeName = "/MyPageScreen";

  const MyPageScreen({Key? key, required this.title}) : super(key: key);

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
            // Text(
            //   Strings.myPageScreenName,
            //   style: Theme.of(context).textTheme.headline4,
            // ),

            _buildButton('Past attendance', AppColors.primaryColor,
                AppColors.whiteColor, AppColors.whiteColor, () {
                  Navigator.of(context).pushReplacementNamed(
                    PreviousAttendScreen.routeName,
                  );
                }),
            SizedBox(height: 25),
            _buildButton('Contact Us', AppColors.primaryColor,
                AppColors.whiteColor, AppColors.whiteColor, () {
                  Navigator.of(context).pushNamed(
                    ContactUsScreen.routeName,
                  );
                }),
            SizedBox(height: 25),
            _buildButton('Make job record', AppColors.primaryColor,
                AppColors.whiteColor, AppColors.whiteColor, () {
                  Navigator.of(context).pushNamed(
                    MakeJobRecordScreen.routeName,
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
    );
  }

  static Widget _buildButton(String title, Color bg, Color textColor,
      Color borderColor, Function onPress) =>
      MaterialButton(
        onPressed: () => onPress(),
        child: Text(
          title,
          style: TextStyle(
            height: 1,
            fontFamily: 'NotoSanJP',
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        height: 38,
        minWidth: 112,
        padding: EdgeInsets.all(20.0),
        elevation: 0,
        color: bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
            side: BorderSide(color: borderColor)),
      );
}
