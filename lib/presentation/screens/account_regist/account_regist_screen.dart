import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/account_regist/subscreens/auth_code_subscreen.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_description.dart';

import 'widgets/custom_title.dart';

class AccountRegistScreen extends StatefulWidget {
  const AccountRegistScreen({Key? key}) : super(key: key);

  @override
  _AccountRegistScreenState createState() => _AccountRegistScreenState();
}

class _AccountRegistScreenState extends State<AccountRegistScreen> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _validateEmail(String? v) {
    if (v == null || v.isEmpty) {
      return 'Please enter email';
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(v)) {
      return 'Please enter valid email';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? v) {
    if (v!.isEmpty) {
      return 'Please enter password';
    } else if (v.length < 8) {
      return 'Password must have at least 8 characters';
    } else {
      return null;
    }
  }

  String? _validateConfirmPassword(String? v) {
    if (v!.isEmpty) {
      return 'Please enter confirm password';
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  _disposeAll() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void onNextPress() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AuthCodeSubScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        color: Colors.amber,
                        child: Center(child: Text('Image Processing')),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 38.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomTitle(title: 'アカウント情報'),
                                const SizedBox(height: 15.0),
                                CustomDescription(
                                  description:
                                      'Parsowaを利用するアカウント情報を入力してください。\n 仮登録のあと、メールに認証コードをお送りします。',
                                ),
                                const SizedBox(height: 48.0),
                                // Email
                                ..._buildColumnLabelAndTextbox(
                                  label: 'メールアドレス',
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _validateEmail,
                                  controller: _emailController,
                                ),
                                const SizedBox(height: 20.0),
                                // Password
                                ..._buildColumnLabelAndTextbox(
                                  label: 'パスワード',
                                  subLabel: '※半角英数字6文字以上30文字以下',
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscure: true,
                                  validator: _validatePassword,
                                  controller: _passwordController,
                                ),
                                const SizedBox(height: 20.0),
                                // Confirm Password
                                ..._buildColumnLabelAndTextbox(
                                  label: 'パスワード確認',
                                  keyboardType: TextInputType.visiblePassword,
                                  isObscure: true,
                                  validator: _validateConfirmPassword,
                                  controller: _confirmPasswordController,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      _buildBottomButtonSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildColumnLabelAndTextbox(
      {required String label,
      String subLabel = '',
      FontWeight fontWeight = FontWeight.w700,
      TextInputType keyboardType = TextInputType.text,
      TextEditingController? controller,
      bool isObscure = false,
      required String? Function(String?) validator}) {
    return [
      Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: fontWeight,
            ),
          ),
          const SizedBox(width: 10.0),
          Text(
            subLabel,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              height: 1.75,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ],
      ),
      const SizedBox(height: 7.0),
      TextFormField(
        controller: controller!,
        keyboardType: keyboardType,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: _buildInputDecoration(),
        autofocus: false,
        obscureText: isObscure,
        validator: validator,
      ),
    ];
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      ),
    );
  }

  Widget _buildBottomButtonSection() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _buildButton(
                title: '戻る',
                primaryColor: AppColors.whiteColor,
                changeColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: _buildButton(
                title: '次へ',
                primaryColor: AppColors.primaryColor,
                changeColor: AppColors.whiteColor,
                onPressed: onNextPress,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String title,
      required Color primaryColor,
      required Color changeColor,
      required void Function() onPressed}) {
    return ButtonTheme(
      height: 38,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return changeColor;
            }
            return primaryColor;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return primaryColor;
            }
            return changeColor;
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
            if (states.contains(MaterialState.pressed)) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  side: BorderSide(color: primaryColor));
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
              side: changeColor == AppColors.primaryColor
                  ? BorderSide(color: changeColor)
                  : BorderSide.none,
            );
          }),
          // minimumSize: MaterialStateProperty.all<Size>(const Size(140.0, 37.5)),
        ),
      ),
    );
  }
}
