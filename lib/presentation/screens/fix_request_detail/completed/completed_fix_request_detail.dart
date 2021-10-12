import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class CompleteFixRequestDetail extends StatelessWidget {
  static const String routeName = "/CompleteFixRequestDetailScreen";

  const CompleteFixRequestDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isActionHide: false,
        isLeadingHide: true,
        stringTitle: '申し込み',
        onBackPress: () {},
        onClosePress: () {
          Navigator.of(context).pop();
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: _completeBody(context),
        ),
      ),
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
        _textComplete('申し込みありがとうございました'),
        _textComplete('事業者からの連絡をお待ちください'),
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
