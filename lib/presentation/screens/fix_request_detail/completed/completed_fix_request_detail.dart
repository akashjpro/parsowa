import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class CompleteFixRequestDetailScreen extends StatelessWidget {
  static const String routeName = "/CompleteFixRequestDetailScreen";

  const CompleteFixRequestDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isActionHide: true,
        isLeadingHide: false,
        stringTitle: '申し込み',
        onBackPress: () {
          Navigator.of(context).pop();
        },
        onClosePress: () {},
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: _completeBody(context),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }

  //function widget

  Widget _completeBody(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        const Center(
          child: Text(
            '修正依頼が完了いたしました',
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'NotoSanJP',
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 45),
        _textComplete('事業所の承認があるまで'),
        _textComplete('しばらくお待ちください'),
        SizedBox(height: 50),
        SizedBox(
          width: 139,
          height: 38,
          child: _btnOK(),
        )
      ],
    );
  }

  Widget _btnOK() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'OK',
        style: TextStyle(
          color: AppColors.primaryColor,
          fontFamily: 'NotoSanJP',
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: StadiumBorder(),
          primary: AppColors.primaryColor),
    );
  }

  Widget _textComplete(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.blackColor,
          fontFamily: 'NotoSanJP',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

//----------------------------------------------------------------//

}
