import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

class RestPasswordScreen extends StatefulWidget {
  static const String routeName = "/RestPasswordScreen";

  const RestPasswordScreen({Key? key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<RestPasswordScreen> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    passwordController.dispose();
    passwordConfirmController = TextEditingController();
    super.dispose();
  }

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
              _text1('パスワード再設定'),
              SizedBox(height: 18),
              _text2('パスワードを再設定してください。'),
              SizedBox(height: 89),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 38),
                  alignment: Alignment.center,
                  child: _buildInput(passwordController, 'パスワード', 'password',
                      '※半角英数字6文字以上30文字以下')),
              SizedBox(height: 17),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 38),
                  alignment: Alignment.center,
                  child: _buildInput(
                      passwordController, 'パスワード確認', 'password', null)),
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

  _buildInput(TextEditingController controller, String title, String type,
      String? supplement) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontSize: 16.0,
                  color: AppColors.unselectedColor,
                  fontWeight: FontWeight.w700),
            ),
            supplement != null
                ? Text(
                    "※半角英数字6文字以上30文字以下",
                    style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: AppColors.blackColor,
                    ),
                  )
                : SizedBox(width: 0)
          ],
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
  }

  //----------------------------------------------------------------
  //Function

  void _onClickButton() {
    print('hello world');
  }

//----------------------------------------------------------------

}
