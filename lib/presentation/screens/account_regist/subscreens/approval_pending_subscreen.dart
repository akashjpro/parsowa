import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

class ApprovalPendingSubScreen extends StatelessWidget {
  const ApprovalPendingSubScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '登録完了(承認待ち)',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'NotoSanJP',
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 18),
                    _textCustom('承認後にアプリが利用できるようになります。'),
                    _textCustom('承認には時間がかかる場合があります。'),
                    _textCustom('恐れ入りますがしばらくお待ちください。'),
                    SizedBox(height: 22),
                    SizedBox(
                      height: 38,
                      child: _btnOk(
                        'ログイン画面へ',
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
