import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/job_detail/confirm/confirm_screen.dart';
import 'package:parsowa/presentation/screens/job_list_screen/data/job_list_data.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class ContentJobDetailScreen extends StatefulWidget {
  static const String routeName = "/ContentJobDetailScreen";

  final JobData job;
  final String title;

  const ContentJobDetailScreen(
      {Key? key, required this.title, required this.job})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ContentJobDetailScreenState();
}

class ContentJobDetailScreenState extends State<ContentJobDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: widget.title,
          isLeadingHide: true,
          isActionHide: true,
          onBackPress: () => {},
          onClosePress: () => {}),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffF8F6F4),
          child: Column(
            children: [
              introduceSection(),
              _buildTitle('介護者'),
              personSection(),
              _buildTitle('業務内容'),
              businessContentSection(),
              _buildTitle('報酬'),
              salarySection(),
              _buildTitle('期間・日時'),
              periodSection(),
              _buildTitle('注意事項'),
              cautionSection(),
              _buildTitle('持ち物'),
              toBringSection(),
              _buildTitle('参考資料'),
              documentSection(),
              _buildTitle('参考資料'),
              providerSection(),
              buttonSection(),
              // ButtonSection()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  introduceSection() => Container(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.job.officeName,
              style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontSize: 16.0,
                  color: AppColors.unselectedColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 17.0,
            ),
            Text(
              widget.job.title,
              style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontSize: 19.0,
                  color: AppColors.unselectedColor,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Wrap(
              children: _buildTag(widget.job),
            )
          ],
        ),
      );

  personSection() => Container(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPersonInfor(context, 'assets/icons/icon_svg/Mypage_icon.svg',
                widget.job.nameOfUser, widget.job.userInformation),
            const SizedBox(
              height: 10.0,
            ),
            _buildRowIconAndText(
                context,
                'assets/icons/icon_svg/Workplace_icon.svg',
                widget.job.workLocation),
            const SizedBox(
              height: 10.0,
            ),
            _buildSubTitle('介護レベル'),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 26.0),
              child: _buildText(widget.job.careLevel),
            ),
          ],
        ),
      );

  businessContentSection() => Container(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSubTitle('介護カテゴリ'),
            Container(
              margin: const EdgeInsets.only(left: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.job.careCategory
                    .map((careItem) => Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: _buildText(careItem),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _buildSubTitle('サービス区分'),
            Container(
              margin: const EdgeInsets.only(left: 26.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.job.serviceClass
                    .map((serviceItem) => Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: _buildText(serviceItem),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              widget.job.jobDescription,
              style: const TextStyle(
                  height: 1,
                  fontFamily: 'NotoSanJP',
                  fontSize: 16.0,
                  color: AppColors.unselectedColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      );

  salarySection() => Container(
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
      color: AppColors.whiteColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          RichText(
            text: TextSpan(
                text: widget.job.remuneration,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 34.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.unselectedColor,
                ),
                children: const [
                  TextSpan(
                    text: '円',
                    style: TextStyle(
                        fontFamily: 'NotoSanJP',
                        fontSize: 20.0,
                        color: AppColors.unselectedColor,
                        fontWeight: FontWeight.w700),
                  )
                ]),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            '時給：X${widget.job.hourlyPrice}円',
            style: const TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                color: AppColors.unselectedColor,
                fontWeight: FontWeight.w400),
          )
        ],
      ));

  periodSection() => Container(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPersonInfor(
                context,
                'assets/icons/icon_svg/working_days_icon.svg',
                '${widget.job.startDate} ~ ${widget.job.endDate}',
                widget.job.workingDay),
            const SizedBox(
              height: 10.0,
            ),
            _buildRowIconAndText(
                context,
                'assets/icons/icon_svg/Working_hours.svg',
                widget.job.workingHours)
          ],
        ),
      );

  cautionSection() => Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
      color: AppColors.whiteColor,
      child: Text(
        widget.job.caution,
        style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            color: AppColors.unselectedColor,
            fontWeight: FontWeight.w400),
      ));

  toBringSection() => Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
      color: AppColors.whiteColor,
      child: Text(
        widget.job.whatToBring,
        style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            color: AppColors.unselectedColor,
            fontWeight: FontWeight.w400),
      ));

  documentSection() => Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
      color: AppColors.whiteColor,
      child: Text(
        widget.job.referenceDocument,
        style: const TextStyle(
            fontFamily: 'NotoSanJP',
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
            fontSize: 16.0,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400),
      ));

  providerSection() => Container(
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 20.0, left: 45.0, right: 25.0),
        color: AppColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSubTitle('事業名'),
            Container(
              margin: const EdgeInsets.only(left: 26.0, top: 10),
              child: _buildText(widget.job.providerName),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _buildSubTitle('メールアドレス (お問い合わせ)'),
            Container(
                margin: const EdgeInsets.only(left: 26.0, top: 10),
                child: Text(
                  widget.job.providerMail,
                  style: const TextStyle(
                      height: 1,
                      fontFamily: 'NotoSanJP',
                      decoration: TextDecoration.underline,
                      decorationThickness: 1.5,
                      fontSize: 16.0,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                )),
            const SizedBox(
              height: 10.0,
            ),
            _buildSubTitle('住所'),
            Container(
              margin: const EdgeInsets.only(left: 26.0, top: 10),
              child: _buildText(widget.job.providerAddress),
            ),
            const SizedBox(
              height: 10.0,
            ),
            _buildSubTitle('アクセス'),
            Container(
                margin: const EdgeInsets.only(left: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.job.providerHowToAcsess
                      .map((careItem) => Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: _buildText(careItem),
                          ))
                      .toList(),
                ))
          ],
        ),
      );

  buttonSection() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 20),
        height: 80,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border(
              top: BorderSide(
                  width: 1, color: const Color(0xff9d9d9d).withOpacity(0.5)),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: _buildButton('戻る', AppColors.whiteColor,
                  AppColors.primaryColor, AppColors.primaryColor, () {
                Navigator.of(context).pop(true);
              }),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              flex: 1,
              child: _buildButton('申し込む', AppColors.primaryColor,
                  AppColors.whiteColor, AppColors.whiteColor, () {
                Navigator.of(context).pushNamed(
                  ConfirmJobDetailScreen.routeName,
                );
              }),
            ),
          ],
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
            side: BorderSide(color: borderColor)),
      );

  Widget _buildTitle(String title) => Container(
        height: 32.0,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          title,
          style: const TextStyle(
              height: 1,
              fontFamily: 'NotoSanJP',
              fontSize: 17.0,
              color: AppColors.unselectedColor,
              fontWeight: FontWeight.w700),
        ),
      );

  Widget _buildSubTitle(String subTitle) => Text(
        subTitle,
        style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            color: AppColors.unselectedColor,
            fontWeight: FontWeight.w700),
      );

  Widget _buildText(String text) => Text(
        text,
        style: const TextStyle(
            height: 1,
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            color: AppColors.unselectedColor,
            fontWeight: FontWeight.w400),
      );

  Widget _buildRowIconAndText(
          BuildContext context, String uriIcon, String content) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            uriIcon,
            width: 16.0,
            height: 16.0,
            color: const Color(0xff9d9d9d),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 9.0,
          ),
          Text(
            content,
            style: const TextStyle(
                height: 1.2,
                fontFamily: 'NotoSanJP',
                fontSize: 16.0,
                color: AppColors.unselectedColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      );

  Widget _buildPersonInfor(BuildContext context, String uriIcon,
          String personName, String personInfo) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            uriIcon,
            width: 16.0,
            height: 16.0,
            color: const Color(0xff9d9d9d),
            alignment: Alignment.center,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            width: 9.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                personName,
                style: const TextStyle(
                    height: 1,
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    color: AppColors.unselectedColor,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                personInfo,
                style: const TextStyle(
                    height: 1,
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    color: AppColors.unselectedColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      );

  List<Widget> _buildTag(JobData job) {
    return job.tagList
        .map((tag) => Container(
              margin: const EdgeInsets.only(right: 5.0, top: 10),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: const BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Text(
                tag,
                style: const TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 12.0,
                    color: Color(0xff616161),
                    fontWeight: FontWeight.w400),
              ),
            ))
        .toList();
  }
}
