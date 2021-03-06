import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class CompleteJobDetailScreen extends StatelessWidget {
  static const String routeName = "/CompleteJobDetailScreen";

  const CompleteJobDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isActionHide: false,
        isLeadingHide: true,
        stringTitle: '申し込み',
        onBackPress: () {},
        onClosePress: () {
          int count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: completeBody(context),
        ),
      ),
    );
  }

  //function

  Widget completeBody(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        const Center(
          child: Text(
            '申し込みが完了しました',
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'NotoSanJP',
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 45),
        const Center(
          child: Text(
            '申し込みありがとうございました',
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'NotoSanJP',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Center(
          child: Text(
            '事業者からの連絡をお待ちください',
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'NotoSanJP',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 50),
        SizedBox(
          width: 139,
          height: 38,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: StadiumBorder(),
                primary: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
