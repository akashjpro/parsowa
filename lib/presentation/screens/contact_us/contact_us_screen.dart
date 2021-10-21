import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class ContactUsScreen extends StatelessWidget {
  static const String routeName = "/ContactUsScreen";
  final title;

  ContactUsScreen({Key? key, required this.title}) : super(key: key);
  List<String> pullDownList = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBarCustom(
            stringTitle: Strings.contactUsTitle,
            isLeadingHide: false,
            isActionHide: true,
            onBackPress: () => {Navigator.of(context).pop()},
            onClosePress: () => {}),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 38, vertical: 20),
            child: Column(
              children: [
                _buildDescripton('''お問い合せに関する注釈文を表示...
お問い合せに関する注釈文を表示...
お問い合せに関する注釈文を表示...
お問い合せに関する注釈文を表示...
※システムに関するお問い合わせのみ
'''),
                const SizedBox(height: 15),
                _buildDropDown(context),
                const SizedBox(height: 25),
                _buildContents(context),
                const SizedBox(height: 75),
                _buildButton('送信', AppColors.primaryColor, AppColors.whiteColor,
                    AppColors.primaryColor, () {
                  FocusScope.of(context).unfocus();
                  _showDialogConfirm(context);
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 4),
      ),
    );
  }

  _buildDescripton(String des) => Container(
        alignment: Alignment.topLeft,
        child: Text(
          des,
          style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.unselectedColor),
        ),
      );

  _buildDropDown(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '件名',
            style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.unselectedColor),
          ),
          const SizedBox(height: 10),
          Container(
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.borderColor, width: 1),
            ),
            child: DropdownButton<String>(
              menuMaxHeight: 300,
              isExpanded: true,
              underline: Container(),
              items: pullDownList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.unselectedColor,
                          fontFamily: 'NotoSanJP',
                          fontWeight: FontWeight.w400)),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        ],
      );

  _buildContents(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'お問い合わせ内容',
            style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.unselectedColor),
          ),
          const SizedBox(height: 10),
          TextField(
            autofocus: false,
            maxLines: 8,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              filled: false,
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.borderColor, width: 1),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      );

  Widget _buildButton(String title, Color bg, Color textColor,
          Color borderColor, Function onPress) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 38,
              margin: EdgeInsets.symmetric(horizontal: 80),
              child: MaterialButton(
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
              ),
            ),
          ),
        ],
      );

  void _showDialogConfirm(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              '送信確認',
              style: TextStyle(
                height: 1,
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.unselectedColor,
              ),
            ),
            content: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '以下の内容で送信します。よろしいですか？',
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.unselectedColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  '件名：システムの不具合について',
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.unselectedColor,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('キャンセル',
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'NotoSanJP',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff006088),
                      ))),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _showDialogComplet(context);
                  },
                  child: const Text('送信する',
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'NotoSanJP',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff006088),
                      ))),
            ],
          );
        });
  }

  void _showDialogComplet(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              '送信完了',
              style: TextStyle(
                height: 1,
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.unselectedColor,
              ),
            ),
            content: const Text(
              '送信が完了しました。',
              style: TextStyle(
                height: 1,
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: AppColors.unselectedColor,
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK',
                      style: TextStyle(
                        height: 1,
                        fontFamily: 'NotoSanJP',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff006088),
                      ))),
            ],
          );
        });
  }
}
