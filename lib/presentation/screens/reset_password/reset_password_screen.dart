import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

class RestPasswordScreen extends StatefulWidget {
  const RestPasswordScreen({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<RestPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height,
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              _text1('パスワードリセット'),
              SizedBox(height: 18),
              _text2('パスワードを再設定してください。'),
              SizedBox(height: 89),
              _customTextField('メールアドレス', '※半角英数字6文字以上30文字以下'),
              SizedBox(height: 17),
              _customTextField('パスワード確認', ''),
              SizedBox(height: 115),
              SizedBox(
                height: 38,
                width: 140,
                child: _buttonClick('設定', _onClickButton),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  //----------------------------------------------------------------
  //Widget

  Widget _text1(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 22,
        fontFamily: 'NotoSanJP',
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _text2(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'NotoSanJP',
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _customTextField(String text, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.0,
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 26),
                  Text(
                    text2,
                    style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              //obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonClick(String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
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
        primary: AppColors.primaryColor,
        onPrimary: Colors.white,
      ),
    );
  }

  //----------------------------------------------------------------
  //Function

  void _onClickButton() {
    print('hello world');
  }

  //----------------------------------------------------------------

}
