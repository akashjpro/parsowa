import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_description.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_title.dart';

class AuthCodeSubScreen extends StatefulWidget {
  const AuthCodeSubScreen({Key? key}) : super(key: key);

  @override
  _AuthCodeSubScreenState createState() => _AuthCodeSubScreenState();
}

class _AuthCodeSubScreenState extends State<AuthCodeSubScreen> {
  final _formKey = GlobalKey<FormState>();
  final _verificationCode = TextEditingController();

  onNextPress() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AuthCodeSubScreen(),
        ),
      );
    }
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
                                CustomTitle(title: '認証コード確認'),
                                const SizedBox(height: 15.0),
                                CustomDescription(
                                  description:
                                      '設定したメールアドレスに認証コードをお送りしましたので、入力してください。\n メールが届かない場合は、ドメインの設定をお願いいたします。',
                                ),
                                const SizedBox(height: 15.0),
                                Text(
                                  '* 認証コードの有効期限は24時間です。\n 24時間以内に認証してください。',
                                  style: TextStyle(
                                    fontFamily: 'NotoSanJP',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                    color: AppColors.errorColor,
                                  ),
                                ),
                                const SizedBox(height: 50.0),
                                TextFormField(
                                  controller: _verificationCode,
                                  keyboardType: TextInputType.text,
                                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: _buildInputDecoration(),
                                  autofocus: false,
                                  validator: (v) {
                                    if (v!.isEmpty) {
                                      return 'Validation Code must not empty.';
                                    }
                                    return null;
                                  },
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
                  onPressed: onNextPress),
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
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(5.0),
      //   borderSide: BorderSide(
      //     color: AppColors.primaryColor,
      //     width: 1,
      //   ),
      // ),
    );
  }
}
