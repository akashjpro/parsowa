import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/data/user_data.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/data/work_detail_data.dart';
import 'package:parsowa/presentation/screens/fix_request_detail/widgets/custom_dropdownbutton.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class ContentsFixRequestDetailScreen extends StatefulWidget {
  const ContentsFixRequestDetailScreen({Key? key}) : super(key: key);

  @override
  State<ContentsFixRequestDetailScreen> createState() =>
      _ContentsFixRequestDetailScreenState();
}

class _ContentsFixRequestDetailScreenState
    extends State<ContentsFixRequestDetailScreen> {
  final User _user = User.user;
  final WorkDetail _workDetail = WorkDetail.workDetail;

  final categoryRadio = ['出勤', '退勤'];

  String _choosenCate = "";
  int? _selectedTimeDropDownValue;
  int? _selectedMinuteDropDownValue;

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCustom(
          stringTitle: '修正依頼',
          isLeadingHide: false,
          isActionHide: true,
          onBackPress: () {},
          onClosePress: () {},
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              // User
              _buildHeading(title: '利用者情報'),
              _buildSectionContainer(_buildUserSection()),
              // Work Detail
              _buildHeading(title: '勤務日詳細'),
              _buildSectionContainer(_buildTimeWorkSection()),
              // Work Fix Form
              _buildHeading(title: '修正内容入力'),
              _buildSectionContainer(_buildWorkFixFormSection()),
              _buildBottomButtonSection(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }

  Widget _buildBottomButtonSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.borderColor,
            ),
            bottom: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
        ),
        height: 79.0,
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
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: _buildButton(
                  title: '依頼する',
                  primaryColor: AppColors.primaryColor,
                  changeColor: AppColors.whiteColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
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

  Widget _buildWorkFixFormSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSubTitle('修正する日付、時間を選択してください'),
          const SizedBox(height: 7.6),
          _buildGroupRadioButton(),
          const SizedBox(height: 20.0),
          _buildGroupDropDownButton(),
          const SizedBox(height: 20.5),
          _buildGroupReasonFormFieldButton(),
        ],
      ),
    );
  }

  Widget _buildGroupReasonFormFieldButton() {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSubTitle('修正依頼の理由'),
          const SizedBox(height: 6.9),
          Form(
            key: _formKey,
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 80.0,
              ),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.errorColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle(String content) {
    return Text(
      content,
      textAlign: TextAlign.start,
      style: const TextStyle(
        fontFamily: 'NotoSanJP',
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
    );
  }

  Widget _buildGroupDropDownButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _buildDropDownButtonTimeGroup(
            length: 24,
            hint: '時',
          ),
        ),
        Expanded(
          // flex: 2,
          child: _buildDropDownButtonMinuteGroup(
            length: 61,
            hint: '分',
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildDropDownButtonMinuteGroup(
      {required int length, required String hint}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 38.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: _selectedMinuteDropDownValue == null
                    ? AppColors.borderColor
                    : AppColors.primaryColor,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              minWidth: 68.0,
              child: CustomDropdownButton<int>(
                items: List<CustomDropdownMenuItem<int>>.generate(
                  length,
                  (index) => CustomDropdownMenuItem(
                      value: index, child: _buildDropDownMenuItemOption(index)),
                ),
                isExpanded: true,
                underline: Container(),
                elevation: 1,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.blackColor,
                ),
                borderRadius: BorderRadius.circular(5.0),
                // menuMaxHeight: 200.0,
                value: _selectedMinuteDropDownValue,
                onChanged: (value) {
                  setState(() {
                    _selectedMinuteDropDownValue = value!;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          // flex: 2,
          child: Text(
            hint,
            style: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropDownButtonTimeGroup(
      {required int length, required String hint}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 38.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: _selectedTimeDropDownValue == null
                    ? AppColors.borderColor
                    : AppColors.primaryColor,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              minWidth: 68.0,
              child: CustomDropdownButton<int>(
                items: List<CustomDropdownMenuItem<int>>.generate(
                  length,
                  (index) => CustomDropdownMenuItem(
                    value: index,
                    child: _buildDropDownMenuItemOption(index),
                  ),
                ),
                isExpanded: true,
                underline: Container(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.blackColor,
                ),
                elevation: 1,
                // menuMaxHeight: 200.0,
                value: _selectedTimeDropDownValue,
                onChanged: (value) {
                  setState(() {
                    _selectedTimeDropDownValue = value!;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            hint,
            style: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGroupRadioButton() {
    return Container(
      height: 51.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: _choosenCate.isEmpty
              ? AppColors.borderColor
              : AppColors.primaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Radio(
                  value: categoryRadio[0],
                  groupValue: _choosenCate,
                  onChanged: (String? value) {
                    setState(() => _choosenCate = value!);
                  },
                ),
                const Text(
                  '出勤',
                  style: TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: AppColors.verticalSeperator,
            thickness: 1,
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Radio(
                  value: categoryRadio[1],
                  groupValue: _choosenCate,
                  onChanged: (String? value) {
                    setState(() => _choosenCate = value!);
                  },
                ),
                const Text(
                  '退勤',
                  style: TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    height: 1.2,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeWorkSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 37.5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '勤務日',
                style: TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontSize: 16.0,
                  height: 1.8,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                _workDetail.workingDate,
                style: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                  fontSize: 20.0,
                  height: 1.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSubtimeWorkSection(
                title: '出勤',
                time: _workDetail.startTime,
              ),
              const SizedBox(width: 26.0),
              _buildSubtimeWorkSection(
                title: '退勤',
                time: _workDetail.endTime,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubtimeWorkSection(
      {required String title, required String time}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontWeight: FontWeight.w400,
            color: AppColors.blackColor,
            fontSize: 16.0,
            height: 1.8,
          ),
        ),
        const SizedBox(width: 7.0),
        Text(
          time,
          style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
            fontSize: 26.0,
            height: 1.2,
          ),
        )
      ],
    );
  }

  Widget _buildSectionContainer(Widget section) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17.1),
      child: section,
    );
  }

  Widget _buildUserSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 37.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${_user.username} ',
                style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackColor,
                  fontSize: 16.0,
                  height: 1.8,
                ),
              ),
              Text(
                '(${_user.sex}/${_user.age}代)',
                style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                  fontSize: 12.0,
                  height: 1.2,
                ),
              )
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildTagIconWithInfo(
                icon: 'assets/icons/icon_svg/working_days_icon.svg',
                info: _workDetail.weekDays.join('/'),
              ),
              const SizedBox(width: 17.6),
              _buildTagIconWithInfo(
                icon: 'assets/icons/icon_svg/Working_hours.svg',
                info: '${_workDetail.startTime}~${_workDetail.endTime}',
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          _buildTagIconWithInfo(
            icon: 'assets/icons/icon_svg/Workplace_icon_on.svg',
            info: _workDetail.address.join(""),
          ),
        ],
      ),
    );
  }

  Widget _buildTagIconWithInfo({required String icon, required String info}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          icon,
          width: 16.0,
          height: 16.0,
          color: AppColors.tagIconColor,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 10.9),
        Text(
          info,
          style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildHeading({required String title}) {
    return Container(
      padding: const EdgeInsets.only(left: 25.0),
      height: 30.0,
      width: double.infinity,
      color: AppColors.headingBackgroundColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          maxLines: 1,
          style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
            fontSize: 17.0,
            height: 1.2,
          ),
        ),
      ),
    );
  }

  _buildDropDownMenuItemOption(int index) {
    return index < 10
        ? Text(
            '0${index.toString()}',
            style: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          )
        : Text(
            index.toString(),
            style: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          );
  }
}
