import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list/previous_attend_screen.dart';
import 'package:parsowa/presentation/screens/contact_us/contact_us_screen.dart';
import 'package:parsowa/presentation/screens/make_job_record/make_job_record.dart';
import 'package:parsowa/presentation/screens/make_job_record/make_job_record_screen.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

import '../../../core/constants/strings.dart';

class MyPageScreen extends StatelessWidget {
  static const String routeName = "/MyPageScreen";

  const MyPageScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBarCustom(
        stringTitle: title,
        isActionHide: true,
        isLeadingHide: true,
        onBackPress: () {},
        onClosePress: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            ...ListTile.divideTiles(
              color: AppColors.borderColor,
              context: context,
              tiles: [
                _buildListTile(
                  label: 'ユーザ情報',
                  onTap: () {
                    // show screen 39 user info
                  },
                ),
                _buildListTile(
                  label: '報酬確認',
                  onTap: () {
                    // show screen 40 salary detail
                  },
                ),
                _buildListTile(
                  label: '過去の出退勤',
                  onTap: () {
                    // show screen 34 attend list
                  },
                ),
                _buildListTile(
                  label: 'お問合せ',
                  onTap: () {
                    // show screen 43 contact us
                  },
                ),
                _buildListTile(
                  label: 'サービス内容・使い方',
                  onTap: () {
                    // show screen 42 service and usage
                  },
                ),
                _buildListTile(
                  label: '利用規約',
                  onTap: () {
                    // show screen 45 terms of use
                  },
                ),
                _buildListTile(
                  label: 'プライバシーポリシー',
                  onTap: () {
                    // show screen 44 privacy policy
                  },
                ),
                _buildListTile(
                  label: '退会する',
                  onTap: () {
                    // show screen 41 quit service
                  },
                ),
                const ListTile(),
              ],
            ).toList(),
            Image.asset(
              'assets/logo/logo.png',
              height: 62.0,
              width: 56.0,
            ),
            const SizedBox(height: 10.0),
            const Text(
              'バージョン：1.0.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 4),
    );
  }

  Widget _buildListTile({required String label, required Function()? onTap}) {
    return ListTile(
      title: _buildLabel(label),
      trailing: SvgPicture.asset(
        'assets/icons/icon_svg/next_btn.svg',
        width: 16.0,
        height: 16.0,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: 'NotoSanJP',
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
      ),
    );
  }
}
