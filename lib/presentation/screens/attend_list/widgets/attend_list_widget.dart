import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/attend_list/data/attebd_list_data.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/content/content_fix_request_detail.dart';
import 'package:parsowa/presentation/screens/job_detail/content/content_screen.dart';
import 'package:parsowa/presentation/screens/job_list/data/job_list_data.dart';
import 'package:parsowa/presentation/screens/qr_code_read/qr_code_read_screen.dart';

class AttendListWidget {
  static searchSection(DateTime date) => Container(
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border(
              bottom: BorderSide(
                  width: 1.5, color: const Color(0xff9d9d9d).withOpacity(0.3)),
            )),
        height: 50.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconButton('assets/icons/icon_svg/back_btn.svg', () {}),
            Text(
              _formatDate(date),
              style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: AppColors.unselectedColor),
            ),
            _buildIconButton('assets/icons/icon_svg/next_btn.svg', () {})
          ],
        ),
      );

  static Widget buildAttendItem(
          BuildContext context, AttendList item, int typeScreen) =>
      Container(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.officeName,
                      style: const TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 16.0,
                          color: AppColors.unselectedColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${item.lastName}${item.name}',
                      style: const TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 20.0,
                          color: AppColors.unselectedColor,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${item.sex}/${item.age}代',
                      style: const TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 14.0,
                          color: AppColors.unselectedColor,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                  ],
                ),
                if (typeScreen != 2)
                  Column(
                    children: [
                      _buildButton('業務詳細', AppColors.primaryColor,
                          AppColors.whiteColor, AppColors.whiteColor, () {
                        // #33 Job detail screen
                        // TODO: implement JobData
                        final data = JobData.initData();
                        Navigator.of(context).pushNamed(
                          ContentJobDetailScreen.routeName,
                          arguments: data,
                        );
                      }),
                      if (typeScreen == 1)
                        _buildButton('QRコード読込', AppColors.primaryColor,
                            AppColors.whiteColor, AppColors.whiteColor, () {
                          // #35 QR code screen
                          Navigator.of(context).pushNamed(
                            QRCodeReadScreen.routeName,
                          );
                        }),
                      if (typeScreen == 3)
                        _buildButton('記録を書', AppColors.primaryColor,
                            AppColors.whiteColor, AppColors.whiteColor, () {
                          // #36 Fix Request detail
                          Navigator.of(context).pushNamed(
                            ContentsFixRequestDetailScreen.routeName,
                          );
                        })
                    ],
                  )
              ],
            ),
            _buildRowIconAndText(
                context,
                'assets/icons/icon_svg/Workplace_icon.svg',
                '${item.address1}${item.address2}'),
            _dottedLine(),
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '勤務日詳細',
                          style: TextStyle(
                            fontFamily: 'NotoSanJP',
                            fontSize: 19.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.unselectedColor,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff006088),
                              borderRadius: BorderRadius.circular(3)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10),
                          child: Text(
                            item.status,
                            style: const TextStyle(
                              fontFamily: 'NotoSanJP',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '勤務日',
                          style: TextStyle(
                            fontFamily: 'NotoSanJP',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.unselectedColor,
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Text(
                          item.workDate,
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.unselectedColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
            const SizedBox(
              height: 17,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTimeRow('予定', item.scheduledStartTime,
                          item.scheduledLeaveTime),
                      _buildTimeRow('実績', item.startTime, item.leaveTime),
                    ],
                  ),
                ),
                if (typeScreen == 1)
                  _buildButton('修正はこちら', AppColors.primaryColor,
                      AppColors.whiteColor, AppColors.whiteColor, () {
                    // #36 Fix Request detail
                    Navigator.of(context).pushNamed(
                      ContentsFixRequestDetailScreen.routeName,
                    );
                  })
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      );
  static _buildTimeRow(String type, String startTime, String endTime) =>
      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 40,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xffc9c9c9), width: 1),
                    borderRadius: BorderRadius.circular(3)),
                child: Text(
                  type,
                  style: const TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.unselectedColor,
                  ),
                )),
            const SizedBox(
              width: 7,
            ),
            Flexible(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        '出勤',
                        style: TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.unselectedColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          startTime.compareTo('') != 0 ? startTime : '-',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.unselectedColor,
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox())
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '退勤',
                        style: TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.unselectedColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          startTime.compareTo('') != 0 ? endTime : '-',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            color: AppColors.unselectedColor,
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );

  static _buildIconButton(String svgIcon, Function onTap) => InkWell(
      onTap: () => onTap(),
      child: SvgPicture.asset(
        svgIcon,
        width: 22.0,
        height: 22.0,
        fit: BoxFit.cover,
      ));

  static _formatDate(DateTime date) {
    var formatter = DateFormat('yyyy / MM / dd');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  static Widget _dottedLine() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 17),
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

  static Widget _buildButton(String title, Color bg, Color textColor,
          Color borderColor, Function onPress) =>
      MaterialButton(
        onPressed: () => onPress(),
        child: Text(
          title,
          style: TextStyle(
            height: 1,
            fontFamily: 'NotoSanJP',
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        height: 38,
        minWidth: 112,
        padding: EdgeInsets.zero,
        elevation: 0,
        color: bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
            side: BorderSide(color: borderColor)),
      );

  static Widget _buildRowIconAndText(
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
}
