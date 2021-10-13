import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/job_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/widgets/custom_expansion_panel.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class MakeJobRecord extends StatefulWidget {
  const MakeJobRecord({Key? key}) : super(key: key);

  @override
  _MakeJobRecordState createState() => _MakeJobRecordState();
}

class _MakeJobRecordState extends State<MakeJobRecord> {
  final _jobTypeActive = JobType.jobTypeActive;

  final _isOpenExpandPanels = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBarCustom(
        stringTitle: 'サービス提供記録作成',
        isLeadingHide: false,
        isActionHide: true,
        onBackPress: () {},
        onClosePress: () {},
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildJobTypeSection(),
              _buildExpansionSection(),
              _buildSendSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Padding _buildSendSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 38.0,
              child: _buildButton(
                title: '送信する',
                primaryColor: AppColors.primaryColor,
                changeColor: AppColors.whiteColor,
                onPressed: () {},
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildJobTypeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_jobTypeActive.jobTypeSelect.isNotEmpty) ..._buildJobTypeArea(),
          // change
          if (_jobTypeActive.changesSelect.isNotEmpty) ..._buildChangesArea(),
          // non-insurences
          if (_jobTypeActive.isNonInsurenceService)
            ..._buildNonInsuranceServiceArea(),
        ],
      ),
    );
  }

  CustomExpansionPanelList _buildExpansionSection() {
    return CustomExpansionPanelList(
      elevation: 0.0,
      expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 12.0),
      dividerColor: AppColors.lineStandardColor,
      children: [
        _buildSingleExpansionPanel(
          index: 0,
          label: 'サービスの種類',
          body: const Text('this is body'),
        ),
        _buildSingleExpansionPanel(
          index: 1,
          label: '事前チェック・記録など',
          body: const Text('this is body'),
        ),
        _buildSingleExpansionPanel(
          index: 2,
          label: '身体介護',
          body: const Text('this is body'),
        ),
        _buildSingleExpansionPanel(
          index: 3,
          label: '生活援助',
          body: const Text('this is body'),
        ),
        _buildSingleExpansionPanel(
          index: 4,
          label: '買物記録',
          body: const Text('this is body'),
        ),
        _buildSingleExpansionPanel(
          index: 5,
          label: '退室確認',
          body: const Text('this is body'),
        ),
        _buildSingleExpansionPanel(
          index: 6,
          label: '特記・連絡事項',
          body: const Text('this is body'),
        ),
      ],
      expansionCallback: (i, isOpen) =>
          setState(() => _isOpenExpandPanels[i] = !isOpen),
    );
  }

  CustomExpansionPanel _buildSingleExpansionPanel(
      {required String label, required int index, required Widget body}) {
    return CustomExpansionPanel(
      headerBuilder: (context, isOpen) => _buildHeadingLabel(label: label),
      body: body,
      isExpanded: _isOpenExpandPanels[index],
      canTapOnHeader: true,
      backgroundColor: AppColors.whiteColor,
    );
  }

  List<Widget> _buildNonInsuranceServiceArea() {
    return <Widget>[
      _buildLabel(label: '保険外サービス'),
      _buildNonInsuranceServiceFormInput(),
    ].toList();
  }

  List<Widget> _buildChangesArea() {
    return <Widget>[
      _buildLabel(label: '変更内容'),
      _buildContainerCheckBox(
        _jobTypeActive.changesSelect
            .map((e) => _buildSingleCheckBox(cb: e))
            .toList(),
      ),
      const SizedBox(height: 19.7),
    ].toList();
  }

  List<Widget> _buildJobTypeArea() {
    return <Widget>[
      _buildLabel(label: '業務形態'),
      _buildContainerCheckBox(
        _jobTypeActive.jobTypeSelect
            .map((e) => _buildSingleCheckBox(cb: e))
            .toList(),
      ),
      const SizedBox(height: 19.7),
    ].toList();
  }

  Widget _buildNonInsuranceServiceFormInput() {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      keyboardType: TextInputType.multiline,
      minLines: 1,
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
    );
  }

  Widget _buildContainerCheckBox(List<Widget> child) {
    List<Widget> newChild = [];

    if (child.length > 1) {
      for (var element in child) {
        newChild.add(element);
        newChild.add(const Divider(
          color: AppColors.borderColor,
          height: 1.0,
        ));
      }
      newChild.removeLast();
    } else {
      newChild = [...child];
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        children: newChild,
      ),
    );
  }

  Widget _buildSingleCheckBox({required CheckBoxModel cb}) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: AppColors.borderColor,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
      ),
      child: CheckboxListTile(
        title: Text(
          cb.title,
          style: const TextStyle(
            fontFamily: 'NotoSanJP',
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            height: 1.2,
          ),
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 15.5),
        controlAffinity: ListTileControlAffinity.leading,
        value: cb.isChecked,
        activeColor: AppColors.primaryColor,
        onChanged: (value) {
          setState(() {
            cb.isChecked = value!;
          });
        },
      ),
    );
  }

  Widget _buildButton(
      {required String title,
      required Color primaryColor,
      required Color changeColor,
      required void Function() onPressed}) {
    return ButtonTheme(
      height: 38.0,
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

  Widget _buildHeadingLabel({required label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'NotoSanJP',
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          height: 1.3125,
        ),
      ),
    );
  }

  Widget _buildLabel({required label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.3),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'NotoSanJP',
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
          height: 1.3125,
        ),
      ),
    );
  }
}
