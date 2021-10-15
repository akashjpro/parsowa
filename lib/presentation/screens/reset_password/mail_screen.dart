// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

import 'reset_password_screen.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<MailScreen> {
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
              _text2('本人確認を行います。'),
              _text2('ご登録のメールアドレスを入力してください。'),
              SizedBox(height: 50),
              _customTextField('メールアドレス'),
              SizedBox(height: 75),
              SizedBox(
                height: 38,
                width: 140,
                child: _buttonClick('送信する', onClick),
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

  Widget _customTextField(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: TextField(
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
  //Funtion

  void onClick() {
    print('hello');
    Route route = MaterialPageRoute(builder: (context) => RestPasswordScreen());
    Navigator.push(context, route);
  }

  //----------------------------------------------------------------
}
