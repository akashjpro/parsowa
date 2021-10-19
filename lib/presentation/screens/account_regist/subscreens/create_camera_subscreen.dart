import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parsowa/core/constants/colors.dart';

import 'display_camera_subscreen.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({Key? key, required this.image}) : super(key: key);

  final XFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SizedBox(
                  child: image == null
                      ? Text("")
                      : Image.file(
                          File(image.path),
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xff000000),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      child: _buildText('＊必ず原本全体を撮影してください。', 16, 'NotoSansJP',
                          FontWeight.w500, AppColors.whiteColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 15),
                      child: _buildText('＊枠内に、必要な情報が入っていますか。', 16, 'NotoSansJP',
                          FontWeight.w500, AppColors.whiteColor),
                    ),
                    SizedBox(height: 60),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140,
                            height: 38,
                            child: _customButton2(
                                '撮り直す',
                                () => captureImage(context),
                                AppColors.whiteColor,
                                AppColors.primaryColor),
                          ),
                          SizedBox(width: 19),
                          SizedBox(
                            width: 140,
                            height: 38,
                            child: _customButton2('アップロード', () {},
                                AppColors.primaryColor, AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  captureImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayCamera(),
      ),
    );
  }
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
