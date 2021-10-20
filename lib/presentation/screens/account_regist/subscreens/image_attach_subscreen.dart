import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/account_regist/subscreens/approval_pending_subscreen.dart';
import 'package:parsowa/presentation/screens/account_regist/subscreens/display_camera_subscreen.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class ImageAttachSubScreen extends StatefulWidget {
  const ImageAttachSubScreen({Key? key}) : super(key: key);

  @override
  _ImageAttachSubScreenState createState() => _ImageAttachSubScreenState();
}

class _ImageAttachSubScreenState extends State<ImageAttachSubScreen> {
  XFile? _image;

  onNextPress() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ApprovalPendingSubScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: '',
          isLeadingHide: true,
          isActionHide: true,
          onBackPress: () {},
          onClosePress: () {}),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 28,
                color: AppColors.headingBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: _buildText('本人確認', 16, 'NotoSansJP', FontWeight.w700,
                      AppColors.blackColor),
                ),
              ),
              SizedBox(height: 13),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _richTextLabel(),
                      SizedBox(height: 14),
                      Divider(
                        height: 1,
                        color: AppColors.lineStandardColor,
                      ),
                      SizedBox(height: 11),
                      _buildText('表面', 16, 'NotoSansJP', FontWeight.w700,
                          AppColors.blackColor),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 38,
                        child: _customButton('アップロードする', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayCamera(),
                            ),
                          );
                        }, AppColors.whiteColor, AppColors.primaryColor),
                      ),
                      SizedBox(height: 25),
                      Divider(
                        height: 1,
                        color: AppColors.lineStandardColor,
                      ),
                      SizedBox(height: 15),
                      _buildText('表面', 16, 'NotoSansJP', FontWeight.w700,
                          AppColors.blackColor),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 200,
                        height: 38,
                        child: _customButton('アップロードする', () {},
                            AppColors.primaryColor, AppColors.whiteColor),
                      ),
                      SizedBox(height: 56),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 28,
                color: AppColors.headingBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: _buildText('資格証明確認', 16, 'NotoSansJP', FontWeight.w700,
                      AppColors.blackColor),
                ),
              ),
              SizedBox(height: 11.7),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _richTextLabel2(),
                      SizedBox(height: 16),
                      _buildGroupButton('介護職員初任者研修修了'),
                      SizedBox(height: 16),
                      _buildGroupButton('実務者研修修了'),
                      SizedBox(height: 16),
                      _buildGroupButton('介護福祉士(国家資格)'),
                      SizedBox(height: 16),
                      _buildGroupButton('訪問介護職員養成研修1級課程'),
                      SizedBox(height: 16),
                      _buildGroupButton('訪問介護職員養成研修2級課程'),
                      SizedBox(height: 16),
                      _buildGroupButton('介護職員基礎研修修了'),
                      SizedBox(height: 65),
                    ],
                  ),
                ),
              ),
              _buildBottomButtonSection(),
              SizedBox(height: 20),
              Center(
                  child: _image == null
                      ? Text("")
                      : Image.file(File(_image!.path))),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupButton(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 1,
          color: AppColors.lineStandardColor,
        ),
        SizedBox(height: 11),
        _buildText(
            text, 16, 'NotoSansJP', FontWeight.w700, AppColors.blackColor),
        SizedBox(height: 10),
        SizedBox(
          width: 200,
          height: 38,
          child: _customButton(
              'アップロードする', () {}, AppColors.whiteColor, AppColors.primaryColor),
        ),
      ],
    );
  }

  Widget _customButton(
      String text, Function() onPressed, Color color, Color textColor) {
    return ElevatedButton(
      onPressed: onPressed,
      child: _buildText(text, 16, 'NotoSansJP', FontWeight.w700, textColor),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        //backgroundColor: Color,
      ),
    );
  }

  Widget _customButton2(
      String text, Function() onPressed, Color color, Color textColor) {
    return ElevatedButton(
      onPressed: onPressed,
      child: _buildText(text, 16, 'NotoSansJP', FontWeight.w700, textColor),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
            side: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color),
        //backgroundColor: Color,
      ),
    );
  }

  Widget _richTextLabel() {
    return RichText(
      text: TextSpan(
        children: [
          _buildTextSpan('顔写真つきの', 16, 'NotoSansJP', FontWeight.w400,
              AppColors.errorColor),
          _buildTextSpan('本人確認できるものをアップロード', 16, 'NotoSansJP', FontWeight.w400,
              AppColors.blackColor),
          _buildTextSpan('してください。（免許証、マイナンバーカード、パス', 16, 'NotoSanJP',
              FontWeight.w400, AppColors.blackColor),
          _buildTextSpan('ポートなど）', 16, 'NotoSansJP', FontWeight.w400,
              AppColors.blackColor),
        ],
      ),
    );
  }

  Widget _richTextLabel2() {
    return RichText(
      text: TextSpan(
        children: [
          _buildTextSpan('資格を証明できるものをアップロードしてくださ', 16, 'NotoSansJP',
              FontWeight.w400, AppColors.blackColor),
          _buildTextSpan('い。（介護福祉士、介護職員初任者検証', 16, 'NotoSansJP',
              FontWeight.w400, AppColors.blackColor),
          _buildTextSpan('実務者研修の認定書など）', 16, 'NotoSanJP', FontWeight.w400,
              AppColors.blackColor),
        ],
      ),
    );
  }

  Widget _buildText(String text, double size, String fontFamily,
      FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  _buildTextSpan(String text, double size, String fontFamily,
      FontWeight fontWeight, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  Widget _buildBottomButtonSection() {
    return Container(
      constraints: BoxConstraints(maxHeight: 80.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.5, vertical: 20.0),
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
}
