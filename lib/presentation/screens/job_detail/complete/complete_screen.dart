import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class CompleteJobDetail extends StatelessWidget {
  const CompleteJobDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        stringTitle: '申し込み',
        isLeadingHide: true,
        isActionHide: false,
        onBackPress: onBackPress,
        onClosePress: onClosePress,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        child: completeBody(context),
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
              fontSize: 18,
              fontWeight: FontWeight.w600,
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
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Center(
          child: Text(
            '事業者からの連絡をお待ちください',
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'NotoSanJP',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 50),
        SizedBox(
          width: 139,
          height: 38,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'OK',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: 'NotoSanJP',
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), primary: AppColors.primaryColor),
          ),
        )
      ],
    );
  }

  onClosePress() {}

  onBackPress() {}
}
