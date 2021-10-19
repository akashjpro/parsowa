import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class AccountInfoScreen extends StatefulWidget {
  static const String routeName = "/AccountInfoScreen";

  const AccountInfoScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => AccountInfoScreenState();
}

class AccountInfoScreenState extends State<AccountInfoScreen> {
  final TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.jobListBodyColor,
        appBar: AppBarCustom(
          isLeadingHide: false,
          isActionHide: true,
          stringTitle: widget.title,
          onBackPress: () {},
          onClosePress: () {},
        ),
        body: ListView(
          children: [
            Column(
              children: [
                _buildContentRow(
                    'お名前', 'assets/icons/icon_svg/name_icon.svg', '荒川太郎'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow('フリガナ',
                    'assets/icons/icon_svg/name_ruby_icon.svg', 'アラカワ タロウ'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow(
                    '生年月日',
                    'assets/icons/icon_svg/date_of_birth_icon.svg',
                    '2020年1月20日'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow(
                    '性別', 'assets/icons/icon_svg/gender_icon.svg', '男性'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow('住所', 'assets/icons/icon_svg/address_icon.svg',
                    '東京都目黒区〇〇2-5-5 〇〇ビル'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRowInut(
                    'メールアドレス',
                    'assets/icons/icon_svg/email_icon.svg',
                    mailController,
                    null),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow(
                    '電話番号',
                    'assets/icons/icon_svg/phone_num_icon.svg',
                    '000-0000-0000'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow('介護経験年数(Parsowa登録時)',
                    'assets/icons/icon_svg/experience_icon.svg', '1～3年未満'),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow(
                    '保有資格',
                    'assets/icons/icon_svg/qualification_icon.svg',
                    '''実務者研修終了、訪問介護養成研修1級、実務者研修終了、訪問介護養成研修1級、実務者研修終了、訪問介護養成研修1級、実務者研修終了、訪問介護養成研修1級、実務者研修終了、訪問介護養成研修1級、実務者研修終了、訪問介護養成研修1級実務者研修終了、訪問介護養成研修1級
'''),
                const SizedBox(
                  height: 8,
                ),
                _buildContentRow('自己PR',
                    'assets/icons/icon_svg/self_pr_icon.svg', '''xxxxxxxxxxxx
xxxxxxxxxxxxxxxx

xxxxxxxxx

xxxxxxxxxxxxxx

'''),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  child: Flexible(
                    child: _buildButton('保存する', AppColors.primaryColor,
                        AppColors.whiteColor, AppColors.primaryColor, () {
                      _showCupertinoDialog();
                    }),
                  ),
                )
              ],
            )
          ],
        ),
      );

  _buildContentRow(String title, String iconName, String content) => Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            _buildTitleRow(title, iconName),
            _buildContentLabelRow(content),
          ],
        ),
      );

  _buildContentRowInut(String title, String iconName,
          TextEditingController controller, String? mail) =>
      Container(
        color: AppColors.whiteColor,
        child: Column(
          children: [
            _buildTitleRow(title, iconName),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              height: 40,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: controller,
                style: const TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    color: AppColors.unselectedColor,
                    fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  filled: false,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.borderColor, width: 1),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  _buildTitleRow(String title, String iconName) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.lineStandardColor))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconName,
              width: 20,
              height: 20,
              fit: BoxFit.cover,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(title,
                style: const TextStyle(
                    height: 1,
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    color: AppColors.unselectedColor,
                    fontWeight: FontWeight.w700))
          ],
        ),
      );

  _buildContentLabelRow(String content) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.lineStandardColor))),
        child: Text(
          content,
          style: const TextStyle(
              height: 1,
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              color: AppColors.unselectedColor,
              fontWeight: FontWeight.w500),
        ),
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

  void _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text(
              'メールアドレス変更',
              style: TextStyle(
                height: 1,
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: AppColors.unselectedColor,
              ),
            ),
            content: const Text(
              'メールアドレスを変更します。よろしいですか？',
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
                  },
                  child: const Text('OK',
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
}
