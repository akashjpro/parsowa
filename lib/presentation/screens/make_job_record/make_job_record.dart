import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/advance_check_section_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/job_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/service_section_types.dart';
import 'package:parsowa/presentation/screens/make_job_record/widgets/custom_expansion_panel.dart';
import 'package:parsowa/presentation/screens/make_job_record/widgets/custom_radio_group_button_2.dart';
import 'package:parsowa/presentation/screens/make_job_record/widgets/custom_radio_group_button_3.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class MakeJobRecord extends StatefulWidget {
  const MakeJobRecord({Key? key}) : super(key: key);

  @override
  _MakeJobRecordState createState() => _MakeJobRecordState();
}

class _MakeJobRecordState extends State<MakeJobRecord> {
  // data
  final _jobTypeActive = JobType.jobTypeActive;
  // Service Type Section
  final _serviceTypeActive = ServiceType.serviceTypeActive;
  final _visitTypeActive = VisitType.visitTypeActive;
  final _serviceForDisableTypeActive =
      ServiceForDisableType.serviceForDisableTypeActive;
  final _serviceForCommunityLifeTypeActive =
      ServiceForCommunityLifeType.serviceForCommunityLifeTypeActive;
  // Advance Check Section
  final _physicalConRecType = PhysicalConRecType.physicalConRecTypeActive;
  final _precheckTypeActive = PhysicalConRecType.precheckTypeActive;

  // local variables
  final _isOpenExpandPanels = [false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarCustom(
          stringTitle: 'サービス提供記録作成',
          isLeadingHide: false,
          isActionHide: true,
          onBackPress: () {},
          onClosePress: () {},
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
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
      ),
    );
  }

  Widget _buildSendSection() {
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
          body: _buildServiceTypeSection(),
        ),
        _buildSingleExpansionPanel(
          index: 1,
          label: '事前チェック・記録など',
          body: _buildAdvanceCheckSection(),
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

  Widget _buildAdvanceCheckSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          _buildSubContainerInsideExpansion(
            _buildPhysicalConditionRecordArea(),
          ),
          const SizedBox(height: 10.0),
          _buildSubContainerInsideExpansion(
            _buildPrecheckArea(),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildPrecheckArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '事前チェック'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _precheckTypeActive[0]),
          _buildSingleCheckBox(cb: _precheckTypeActive[1]),
        ]),
      ],
    );
  }

  Widget _buildPhysicalConditionRecordArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '体調記録'),
        _buildCustomContainer(
          [
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[0],
              child: [
                _buildSingleMultiLinesInputWithHintLabel(
                  hintLabel: '状態',
                  cb: _physicalConRecType.physicalConRecType[0],
                  onChanged: (v) {},
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[1],
              child: [
                _buildSingleMultiLinesInputWithHintLabel(
                  hintLabel: '状態',
                  cb: _physicalConRecType.physicalConRecType[1],
                  onChanged: (v) {},
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[2],
              child: [
                _buildSingleRowLabelAndInput(
                  label: '℃',
                  cb: _physicalConRecType.physicalConRecType[2],
                  onChanged: (v) {},
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[3],
              child: [
                _buildInputGroupWithSlash(
                    _physicalConRecType.physicalConRecType[3]),
              ],
            ),
          ],
        ),
      ],
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
      _buildCustomContainer(
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
      _buildCustomContainer(
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
      autofocus: false,
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

  Widget _buildCustomContainer(List<Widget> child) {
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
        borderRadius: BorderRadius.circular(3.0),
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
          // overlayColor: MaterialStateProperty.all(AppColors.whiteColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
      ),
      child: Container(
        color: AppColors.whiteColor,
        child: CheckboxListTile(
          contentPadding: const EdgeInsets.only(left: 15.5),
          title: Container(
            constraints: const BoxConstraints(maxWidth: 208.0),
            child: Text(
              cb.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                height: 1.2,
              ),
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: cb.isChecked,
          activeColor: AppColors.primaryColor,
          onChanged: (value) {
            setState(() {
              cb.isChecked = value!;
            });
          },
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

  Widget _buildSubLabel({required label, bool isChecked = false}) {
    return Text(
      label,
      style: TextStyle(
        fontFamily: 'NotoSanJP',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        height: 1.75,
        color: isChecked ? AppColors.blackColor : AppColors.disableTextColor,
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

  Widget _buildServiceTypeSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        children: [
          _buildSubContainerInsideExpansion(
            _buildCareServiceArea(),
          ),
          const SizedBox(height: 10.0),
          _buildSubContainerInsideExpansion(
            _buildIntergratedServiceArea(),
          ),
          const SizedBox(height: 10.0),
          _buildSubContainerInsideExpansion(
            _buildServiceForDisabilitiesArea(),
          ),
          const SizedBox(height: 10.0),
          _buildSubContainerInsideExpansion(
            _buildServiceForCommunityLifeArea(),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildServiceForCommunityLifeArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '地域生活支援'),
        _buildCustomContainer([
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForCommunityLifeTypeActive
                .serviceForCommunityLifeType[0],
            child: [
              CustomRadioGroupButtonTwo(
                  labels: const ['身体伴う', '身体伴わない'],
                  isChecked: _serviceForCommunityLifeTypeActive
                      .serviceForCommunityLifeType[0].isChecked),
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForCommunityLifeTypeActive
                    .serviceForCommunityLifeType[0],
                onChanged: (v) {},
              ),
              _buildSingleRowLabelAndMultiLinesInput(
                label: '行先',
                cb: _serviceForCommunityLifeTypeActive
                    .serviceForCommunityLifeType[0],
                onChanged: (v) {},
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _buildServiceForDisabilitiesArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '障害者総合支援'),
        _buildCustomContainer([
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[0],
            child: [
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[0],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[1],
            child: [
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[1],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[2],
            child: [
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[2],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[3],
            child: [
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[3],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[4],
            child: [
              CustomRadioGroupButtonTwo(
                isChecked: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[4].isChecked,
                labels: const ['身体伴う', '身体伴わない'],
              ),
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[4],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[5],
            child: [
              CustomRadioGroupButtonTwo(
                isChecked: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[5].isChecked,
                labels: const ['身体伴う', '身体伴わない'],
              ),
              _buildSingleRowLabelAndInput(
                label: '分',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[5],
                onChanged: (v) {},
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _buildIntergratedServiceArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '総合事業'),
        _buildCustomContainer(
          [
            _buildColumnCheckBoxAndChildren(
              cb: _visitTypeActive.visitChoices[0],
              child: [
                const CustomRadioGroupButtonThree(
                  indexOfListCheck: 0,
                  labels: ['I', 'II', 'III'],
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _visitTypeActive.visitChoices[1],
              child: [
                const CustomRadioGroupButtonThree(
                  indexOfListCheck: 1,
                  labels: ['I', 'II', 'III'],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCareServiceArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '介護サービス'),
        _buildCustomContainer(
          [
            _buildColumnCheckBoxAndChildren(
              cb: _serviceTypeActive.careChoices[0],
              child: [
                _buildInputGroup(
                  _serviceTypeActive.careChoices[0],
                )
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _serviceTypeActive.careChoices[1],
              child: [
                CustomRadioGroupButtonTwo(
                  isChecked: _serviceTypeActive.careChoices[1].isChecked,
                  labels: const ["45分未満", "45分以上"],
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _serviceTypeActive.careChoices[2],
              child: [
                CustomRadioGroupButtonTwo(
                  isChecked: _serviceTypeActive.careChoices[2].isChecked,
                  labels: const ["１回", "２回"],
                ),
                // const DottedLine(dashColor: AppColors.borderColor),
                _buildSingleRowLabelAndInput(
                  label: '分',
                  cb: _serviceTypeActive.careChoices[2],
                  onChanged: (v) {},
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColumnCheckBoxAndChildren(
      {required CheckBoxModel cb, required List<Widget> child}) {
    List<Widget> newChild = [];

    if (child.length > 1) {
      for (var e in child) {
        newChild.add(
          Container(
            height: 58.0,
            color: !cb.isChecked ? AppColors.disabledColor : null,
            child: e,
          ),
        );
        newChild.add(
          const DottedLine(dashColor: AppColors.borderColor),
        );
      }
      newChild.removeLast();
    } else {
      for (var e in child) {
        newChild.add(
          Container(
            height: 58.0,
            color: !cb.isChecked ? AppColors.disabledColor : null,
            child: e,
          ),
        );
      }
    }

    return Column(
      children: [
        _buildSingleCheckBox(
          cb: cb,
        ),
        const DottedLine(dashColor: AppColors.borderColor),
        ...newChild
      ],
    );
  }

  Widget _buildInputGroup(CheckBoxModel cb) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 41.0),
        _buildRowLabelAndInput(
          label: '身体',
          cb: cb,
          onChanged: (v) {},
        ),
        const SizedBox(width: 18.0),
        _buildRowLabelAndInput(
          label: '生活',
          cb: cb,
          onChanged: (v) {},
        ),
      ],
    );
  }

  Widget _buildInputGroupWithSlash(CheckBoxModel cb) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 41.0),
        _buildRowLabelAndInput(
          label: '',
          cb: cb,
          onChanged: (v) {},
        ),
        const SizedBox(width: 19.5),
        Text(
          '/',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 26.0,
            fontWeight: FontWeight.w400,
            height: 1.2,
            color: cb.isChecked
                ? AppColors.blackColor
                : AppColors.disableTextColor,
          ),
        ),
        const SizedBox(width: 19.5),
        _buildRowLabelAndInput(
          label: '',
          cb: cb,
          onChanged: (v) {},
        ),
      ],
    );
  }

  Widget _buildSingleMultiLinesInputWithHintLabel(
      {required String hintLabel,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 41.0),
        SizedBox(
          width: 231.0,
          height: 38.0,
          child: TextField(
            decoration: InputDecoration(
              enabled: cb.isChecked,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              contentPadding: const EdgeInsets.only(left: 10.0),
              hintText: hintLabel,
            ),
            autofocus: false,
            minLines: 1,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSingleRowLabelAndInput(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 41.0),
        SizedBox(
          width: 70.0,
          height: 38.0,
          child: TextField(
            decoration: InputDecoration(
              enabled: cb.isChecked,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              contentPadding: const EdgeInsets.only(left: 5.0),
            ),
            autofocus: false,
            maxLines: 1,
            keyboardType: TextInputType.text,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 6.0),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: _buildSubLabel(label: label, isChecked: cb.isChecked),
        ),
      ],
    );
  }

  Widget _buildSingleRowLabelAndMultiLinesInput(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 41.0),
        _buildSubLabel(label: label),
        const SizedBox(width: 6.0),
        SizedBox(
          width: 194.0,
          height: 38.0,
          child: TextField(
            decoration: InputDecoration(
              enabled: cb.isChecked,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              contentPadding: const EdgeInsets.only(left: 10.0, top: 15.0),
              hintText: '',
            ),
            autofocus: false,
            minLines: 2,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSubContainerInsideExpansion(Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: AppColors.disabledColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: child,
      ),
    );
  }

  Widget _buildRowLabelAndInput(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSubLabel(label: label, isChecked: cb.isChecked),
        const SizedBox(width: 5.0),
        SizedBox(
          width: 70.0,
          height: 38.0,
          child: TextField(
            decoration: InputDecoration(
              enabled: cb.isChecked,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.borderColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              contentPadding: const EdgeInsets.only(left: 5.0),
            ),
            autofocus: false,
            maxLines: 1,
            keyboardType: TextInputType.text,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
