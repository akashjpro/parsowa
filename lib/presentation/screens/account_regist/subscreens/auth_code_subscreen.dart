import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/account_regist/subscreens/personal_info_subscreen.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_description.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_title.dart';

class AuthCodeSubScreen extends StatefulWidget {
  const AuthCodeSubScreen({Key? key}) : super(key: key);

  @override
  _AuthCodeSubScreenState createState() => _AuthCodeSubScreenState();
}

class _AuthCodeSubScreenState extends State<AuthCodeSubScreen> {
  final _formKey = GlobalKey<FormState>();
  final _verificationCodeController = TextEditingController();

  onNextPress() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => PersonalInfoSubScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _verificationCodeController.dispose();
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
                        margin: const EdgeInsets.only(top: 25.0, bottom: 45.0),
                        child: Center(
                          child: Image.asset(
                            'assets/progress_display/Progress_display_02.png',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 38.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CustomTitle(title: '?????????????????????'),
                                const SizedBox(height: 15.0),
                                CustomDescription(
                                  description:
                                      '???????????????????????????????????????????????????????????????????????????????????????????????????????????????\n ???????????????????????????????????????????????????????????????????????????????????????',
                                ),
                                const SizedBox(height: 15.0),
                                Text(
                                  '* ?????????????????????????????????24???????????????\n 24??????????????????????????????????????????',
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
                                  controller: _verificationCodeController,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 37.5,
          vertical: 72.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _buildButton(
                title: '??????',
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
                  title: '??????',
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
      contentPadding: EdgeInsets.all(8.0),
    );
  }
}
