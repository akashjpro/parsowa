// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:parsowa/core/constants/colors.dart';

import 'reset_password_screen.dart';

class RestPasswordInputMailScreen extends StatefulWidget {
  static const String routeName = "/RestPasswordInputMailScreen";

  const RestPasswordInputMailScreen({Key? key}) : super(key: key);

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<RestPasswordInputMailScreen> {
  late TextEditingController mailController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    mailController = TextEditingController();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
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
                _buildText('パスワードリセット', 22, 'NotoSanJP', FontWeight.w700,
                    AppColors.blackColor),
                SizedBox(height: 18),
                _buildText('本人確認を行います。', 14, 'NotoSanJP', FontWeight.w400,
                    AppColors.blackColor),
                _buildText('ご登録のメールアドレスを入力してください。', 14, 'NotoSanJP',
                    FontWeight.w400, AppColors.blackColor),
                SizedBox(height: 50),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 38),
                    alignment: Alignment.center,
                    child: _buildInput(mailController, 'メールアドレス', 'mail')),
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
      ),
    );
  }

  //----------------------------------------------------------------
  //Widget

  Widget _buildText(String text, double size, String fontFamily,
      FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color,
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
                    borderRadius: BorderRadius.circular(5),
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

  _buildInput(TextEditingController controller, String title, String type) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                color: AppColors.unselectedColor,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 7,
          ),
          SizedBox(
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              obscureText: type.compareTo('password') == 0 ? true : false,
              style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontSize: 16.0,
                  color: AppColors.unselectedColor,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                filled: false,
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.borderColor, width: 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ),
        ],
      );

  //----------------------------------------------------------------
  //Funtion

  void onClick() {
    Navigator.of(context).pushNamed(RestPasswordScreen.routeName);
  }

//----------------------------------------------------------------
}
