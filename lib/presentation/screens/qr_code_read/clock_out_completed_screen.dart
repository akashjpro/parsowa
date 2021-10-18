import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

class ClockOutCompletedScreen extends StatelessWidget {
  const ClockOutCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Color(0xffFFC27D),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo/Group118.png'),
              SizedBox(height: 45),
              Container(
                width: 325,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '退勤が完了しました',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NotoSanJP',
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 18),
                    _textCustom('お疲れ様でした！'),
                    _textCustom('「記録」タブからサービス提供記録を'),
                    _textCustom('作成しましょう。'),
                    SizedBox(height: 22),
                    SizedBox(
                      width: 140,
                      height: 38,
                      child: _btnOk(
                        'OK',
                        _onClick,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onClick() {
    print('hello');
  }
}

Widget _textCustom(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontFamily: 'NotoSanJP',
      fontWeight: FontWeight.w400,
      color: AppColors.blackColor,
    ),
  );
}

Widget _btnOk(String text, Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'NotoSanJP',
        fontWeight: FontWeight.w700,
        color: AppColors.whiteColor,
      ),
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: StadiumBorder(),
      onPrimary: AppColors.primaryColor,
    ),
  );
}
