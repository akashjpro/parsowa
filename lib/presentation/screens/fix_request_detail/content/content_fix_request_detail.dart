import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class ContentFixRequestDetail extends StatefulWidget {
  const ContentFixRequestDetail({Key? key}) : super(key: key);

  @override
  _ContentFixRequestDetailState createState() =>
      _ContentFixRequestDetailState();
}

class _ContentFixRequestDetailState extends State<ContentFixRequestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        stringTitle: '記録',
        isLeadingHide: true,
        isActionHide: true,
        onBackPress: onBackPress(),
        onClosePress: onClosePress(),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color(0xffE9E9E9),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardContent(),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: CardContent(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  onBackPress() {}

  onClosePress() {}
}

class CardContent extends StatelessWidget {
  const CardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _groupText(),
                Column(
                  children: [
                    _Button(
                      '業務詳細',
                      () {
                        print('cccbb');
                      },
                    ),
                    SizedBox(height: 11),
                    _Button(
                      '記録を書く',
                      () {
                        print('ccc');
                      },
                    ),
                  ],
                ),
              ],
            ),
            _dottedLine(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '勤務日詳細',
                      style: TextStyle(
                        fontFamily: 'NotoSanJP',
                        fontSize: 19,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '勤務日',
                          style: TextStyle(
                            fontFamily: 'NotoSanJP',
                            fontSize: 14,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 14),
                        Text(
                          '2020/01/10',
                          style: TextStyle(
                            fontFamily: 'NotoSanJP',
                            fontSize: 20,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _tiTleJob('予定', '出勤', '退勤', '10:00', '14:00'),
                    SizedBox(height: 16),
                    _tiTleJob('実績', '出勤', '退勤', '-', '-'),
                  ],
                ),
                SizedBox(
                  height: 26,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      '修正済',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontFamily: 'NotoSanJP',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      //shape: StadiumBorder(),
                      primary: Color(0xff006088),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _groupText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '株式会社 事業所',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '鈴木 一郎様',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 20,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '(男性/70代)',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 14,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 11),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icon()
            SvgPicture.asset(
              'assets/icons/icon_svg/Workplace_icon.svg',
              width: 12.14,
              height: 15.45,
              color: Color(0xff9D9D9D),
            ),
            SizedBox(width: 5),
            Text(
              '東京都港区高輪3丁目1',
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 16,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _Button(String text, Function() onPressed) {
    return Column(
      children: [
        SizedBox(
          height: 38,
          width: 112,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontFamily: 'NotoSanJP',
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: StadiumBorder(),
              primary: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _dottedLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: DottedLine(
        direction: Axis.horizontal,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashGapLength: 1,
        dashColor: Color(0xffC9C9C9),
        dashRadius: 100,
        dashGapRadius: 30,
      ),
    );
  }

  Widget _tiTleJob(
    String text1,
    String text2,
    String text3,
    String time1,
    String time2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Color(0xffC9C9C9)),
          ),
          child: Center(
            child: Text(
              text1,
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 14,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(width: 7),
        Column(
          children: [
            Text(
              text2,
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 14,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 12),
            Text(
              text3,
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 14,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: 59, minHeight: 33),
              alignment: Alignment.center,
              child: Text(
                time1,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(minWidth: 59),
              alignment: Alignment.center,
              child: Text(
                time2,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
