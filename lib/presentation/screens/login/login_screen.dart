import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/job_list/job_list_screen.dart';
import 'package:parsowa/presentation/screens/reset_password/reset_password_input_mail_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  const LoginScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 38),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  logoSection(),
                  const SizedBox(
                    height: 120,
                  ),
                  inputSection(),
                  const SizedBox(
                    height: 115,
                  ),
                  buttonSection(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget logoSection() => Image.asset(
        'assets/logo/logo.png',
        width: 82,
        height: 75,
        fit: BoxFit.cover,
      );

  Widget inputSection() => Column(
        children: [
          _buildInput(usernameController, 'メールアドレス', 'username'),
          const SizedBox(
            height: 17,
          ),
          _buildInput(passwordController, 'パスワード', 'password'),
        ],
      );

  Widget buttonSection() => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildButton('新規登録', AppColors.whiteColor,
                    AppColors.primaryColor, AppColors.primaryColor, () {}),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: _buildButton('ログイン', AppColors.primaryColor,
                    AppColors.whiteColor, AppColors.primaryColor, () {
                  Navigator.of(context).pushReplacementNamed(JobListScreen.routeName);
                }),
              ),
            ],
          ),
          const SizedBox(
            height: 38,
          ),
          Column(
            children: [
              const Text(
                'パスワードを忘れた方はこちら',
                style: TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    color: AppColors.unselectedColor,
                    fontWeight: FontWeight.w400),
              ),
              TextButton(
                child: const Text(
                  'パスワードリセット',
                  style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(RestPasswordInputMailScreen.routeName);
                },
              )
            ],
          )
        ],
      );

  Widget _buildButton(String title, Color bg, Color textColor,
          Color borderColor, Function onPress) =>
      MaterialButton(
        onPressed: () => onPress(),
        child: Text(
          title,
          style: TextStyle(
            height: 1,
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        height: 38,
        minWidth: 140,
        elevation: 0,
        color: bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
            side: BorderSide(color: borderColor, width: 2)),
      );

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
}
