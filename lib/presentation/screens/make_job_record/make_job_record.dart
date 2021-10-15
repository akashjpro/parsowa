import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/advance_check_section_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/body_care_section_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/exit_confirming_section_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/job_type.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/living_assistance_section_type.dart';
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
  // Body Care Section
  final _excretionAssistanceTypeActive =
      BodyCareType.excretionAssistanceTypeActive;
  final _mealAssistanceTypeActive = BodyCareType.mealAssistanceTypeActive;
  final _getDressedTypeActive = BodyCareType.getDressedTypeActive;
  final _subGetDressedTypeActive = BodyCareType.subGetDressedTypeActive;
  final _goingOutTypeActive = BodyCareType.goingOutTypeActive;
  final _wakeUpOrSleepActive = BodyCareType.wakeUpOrSleepActive;
  final _takingMecOrMecPracActive = BodyCareType.takingMecOrMecPracActive;
  final _independenceSupportActive = BodyCareType.independenceSupportActive;
  // Living Assistance Section
  final _cleaningTypeActive = LivingAssistance.cleaningTypeActive;
  final _laundryTypeActive = LivingAssistance.laundryTypeActive;
  final _bedingCareTypeActive = LivingAssistance.bedingCareTypeActive;
  final _clothingTypeActive = LivingAssistance.clothingTypeActive;
  final _preparingMealTypeActive = LivingAssistance.preparingMealTypeActive;
  final _otherTasksTypeActive = LivingAssistance.otherTasksTypeActive;
  // Exit Confirming Section
  final _exitConfirmingTypeActive = ExitConfirming.exitConfirmingTypeActive;

  // local variables
  final _isOpenExpandPanels = [false, false, false, false, false, false, false];

  // dynamic variables
  final int _totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarCustom(
          stringTitle: 'サービス提供記録作成',
          isLeadingHide: false,
          isActionHide: true,
          onBackPress: () => {Navigator.of(context).pop()},
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
          body: _buildBodyCareSection(),
        ),
        _buildSingleExpansionPanel(
          index: 3,
          label: '生活援助',
          body: _buildLivingAssistanceSection(),
        ),
        _buildSingleExpansionPanel(
          index: 4,
          label: '買物記録',
          body: _buildShoppingRecordSection(),
        ),
        _buildSingleExpansionPanel(
          index: 5,
          label: '退室確認',
          body: _buildExitConfirmingSection(),
        ),
        _buildSingleExpansionPanel(
          index: 6,
          label: '特記・連絡事項',
          body: _buildNoteSection(),
        ),
      ],
      expansionCallback: (i, isOpen) =>
          setState(() => _isOpenExpandPanels[i] = !isOpen),
    );
  }

  Widget _buildAdvanceCheckSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
          child: Column(
            children: [
              _buildSubContainerInsideExpansion(
                _buildPhysicalConditionRecordArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildPrecheckArea(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBodyCareSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
          child: Column(
            children: [
              _buildSubContainerInsideExpansion(
                _buildExcretionAssistanceArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildMealAssistantArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildGetDressedArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildGoingOutArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildWakeUpOrSleepArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildTakingMedicineOrMedicalPracticeArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildIndependenceSupportArea(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceTypeSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExitConfirmingSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
          child: _buildSubContainerInsideExpansion(
            _buildExitConfirmingArea(),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 41.0),
            Expanded(
              child: SizedBox(
                height: 71.0,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.borderColor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    contentPadding: EdgeInsets.only(left: 10.0),
                  ),
                  autofocus: false,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (v) {},
                ),
              ),
            ),
            const SizedBox(width: 18.0),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildSendSection() {
    return Column(
      children: [
        const Divider(
            color: AppColors.borderColor, thickness: 0.8, height: 1.0),
        Padding(
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
        ),
      ],
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

  Widget _buildShoppingRecordSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
          child: _buildSubContainerInsideExpansion(
            Column(
              children: [
                _buildRowAmountInput(
                  label: '預り金',
                  onChanged: (v) {},
                ),
                const SizedBox(height: 20.0),
                _buildRowAmountInput(
                  label: '買い物',
                  onChanged: (v) {},
                ),
                const SizedBox(height: 20.0),
                const Divider(
                  color: AppColors.borderColor,
                  height: 1.0,
                  thickness: 1.0,
                ),
                _buildRowSpendTotal(),
                const SizedBox(height: 20.0),
                const DottedLine(dashColor: AppColors.borderColor),
                _buildSingleColumLabelAndInputWithoutCheckBox(
                  label: '内訳',
                  onChanged: (v) {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLivingAssistanceSection() {
    return Column(
      children: [
        const Divider(
          color: AppColors.borderColor,
          thickness: 0.8,
          height: 1.0,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
          child: Column(
            children: [
              _buildSubContainerInsideExpansion(
                _buildCleaningArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildLaundryArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildBeddingCareArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildClothingArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildPreparingMealsArea(),
              ),
              const SizedBox(height: 10.0),
              _buildSubContainerInsideExpansion(
                _buildOtherTasksArea(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRowSpendTotal() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeadingLabel(label: 'おつり'),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            _totalPrice.toString(),
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 34.0,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(width: 6.6),
        const Text(
          '円',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            height: 2.4,
          ),
        ),
        const SizedBox(width: 24.0),
      ],
    );
  }

  Widget _buildRowAmountInput(
      {required String label, required Function(String)? onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeadingLabel(label: label),
        const SizedBox(width: 10.0),
        Expanded(
          child: Container(
            height: 56.0,
            color: AppColors.whiteColor,
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              ),
              autofocus: false,
              maxLines: 1,
              keyboardType: TextInputType.number,
              onChanged: onChanged,
            ),
          ),
        ),
        const SizedBox(width: 6.6),
        const Text(
          '円',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            height: 3,
          ),
        ),
        const SizedBox(width: 24.0),
      ],
    );
  }

  Widget _buildExitConfirmingArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _exitConfirmingTypeActive[0]),
          _buildSingleCheckBox(cb: _exitConfirmingTypeActive[1]),
          _buildSingleCheckBox(cb: _exitConfirmingTypeActive[2]),
          _buildSingleCheckBox(cb: _exitConfirmingTypeActive[3]),
        ]),
      ],
    );
  }

  Widget _buildOtherTasksArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '買物等'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _otherTasksTypeActive[0]),
          _buildSingleCheckBox(cb: _otherTasksTypeActive[1]),
        ]),
      ],
    );
  }

  Widget _buildPreparingMealsArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '調理配下膳'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _preparingMealTypeActive[0]),
          _buildSingleCheckBox(cb: _preparingMealTypeActive[1]),
          _buildSingleCheckBox(cb: _preparingMealTypeActive[2]),
          _buildSingleCheckBox(cb: _preparingMealTypeActive[3]),
          _buildColumnCheckBoxAndChildren(
            cb: _preparingMealTypeActive[4],
            child: [
              _buildSingleColumLabelAndInput(
                label: '献立',
                cb: _preparingMealTypeActive[4],
                onChanged: (v) {},
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _buildClothingArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '衣類'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _clothingTypeActive[0]),
          _buildSingleCheckBox(cb: _clothingTypeActive[1]),
          _buildSingleCheckBox(cb: _clothingTypeActive[2]),
        ]),
      ],
    );
  }

  Widget _buildBeddingCareArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '寝具の手入れ'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _bedingCareTypeActive[0]),
          _buildSingleCheckBox(cb: _bedingCareTypeActive[1]),
          _buildSingleCheckBox(cb: _bedingCareTypeActive[2]),
          _buildSingleCheckBox(cb: _bedingCareTypeActive[3]),
        ]),
      ],
    );
  }

  Widget _buildLaundryArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '洗濯'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _laundryTypeActive[0]),
          _buildSingleCheckBox(cb: _laundryTypeActive[1]),
          _buildSingleCheckBox(cb: _laundryTypeActive[2]),
          _buildSingleCheckBox(cb: _laundryTypeActive[3]),
          _buildSingleCheckBox(cb: _laundryTypeActive[4]),
          _buildSingleCheckBox(cb: _laundryTypeActive[5]),
        ]),
      ],
    );
  }

  Widget _buildCleaningArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '清掃'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _cleaningTypeActive[0]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[1]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[2]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[3]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[4]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[5]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[6]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[7]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[8]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[9]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[10]),
          _buildSingleCheckBox(cb: _cleaningTypeActive[11]),
        ]),
      ],
    );
  }

  Widget _buildIndependenceSupportArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '自立支援'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _independenceSupportActive[0]),
          _buildSingleCheckBox(cb: _independenceSupportActive[1]),
          _buildSingleCheckBox(cb: _independenceSupportActive[2]),
        ]),
      ],
    );
  }

  Widget _buildTakingMedicineOrMedicalPracticeArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '服薬・医療行為'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _takingMecOrMecPracActive[0]),
          _buildSingleCheckBox(cb: _takingMecOrMecPracActive[1]),
          _buildSingleCheckBox(cb: _takingMecOrMecPracActive[2]),
          _buildSingleCheckBox(cb: _takingMecOrMecPracActive[3]),
          _buildSingleCheckBox(cb: _takingMecOrMecPracActive[4]),
          _buildSingleCheckBox(cb: _takingMecOrMecPracActive[5]),
        ]),
      ],
    );
  }

  Widget _buildWakeUpOrSleepArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '起床・就寝'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _wakeUpOrSleepActive[0]),
          _buildSingleCheckBox(cb: _wakeUpOrSleepActive[1]),
          _buildSingleCheckBox(cb: _wakeUpOrSleepActive[2]),
        ]),
      ],
    );
  }

  Widget _buildGoingOutArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '移乗・移動'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _goingOutTypeActive[0]),
          _buildSingleCheckBox(cb: _goingOutTypeActive[1]),
          _buildSingleCheckBox(cb: _goingOutTypeActive[2]),
          _buildSingleCheckBox(cb: _goingOutTypeActive[3]),
          _buildSingleCheckBox(cb: _goingOutTypeActive[4]),
          _buildSingleCheckBox(cb: _goingOutTypeActive[5]),
        ]),
      ],
    );
  }

  Widget _buildGetDressedArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '身なりの保清・整容'),
        _buildCustomContainer([
          _buildColumnCheckBoxAndChildren(
            cb: _getDressedTypeActive[0],
            child: [
              CustomRadioGroupButtonTwo(
                  labels: const ['全身', '部分'],
                  isChecked: (_getDressedTypeActive[0]).isChecked),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: (_getDressedTypeActive[1]),
            child: [
              _buildSubSingleCheckBox(
                subCb: (_subGetDressedTypeActive[0]),
                cb: _getDressedTypeActive[1],
              ),
              _buildSubSingleCheckBox(
                subCb: (_subGetDressedTypeActive[1]),
                cb: _getDressedTypeActive[1],
              ),
              _buildSubSingleCheckBox(
                subCb: (_subGetDressedTypeActive[2]),
                cb: _getDressedTypeActive[1],
              ),
              _buildSubSingleCheckBox(
                subCb: (_subGetDressedTypeActive[3]),
                cb: _getDressedTypeActive[1],
              ),
            ],
          ),
          _buildSingleCheckBox(cb: _getDressedTypeActive[2]),
          _buildColumnCheckBoxAndChildren(
            cb: _getDressedTypeActive[3],
            child: [
              CustomRadioGroupButtonTwo(
                  labels: const ['入浴', 'シャワー浴'],
                  isChecked: (_getDressedTypeActive[3]).isChecked),
            ],
          ),
          _buildSingleCheckBox(cb: _getDressedTypeActive[4]),
          _buildSingleCheckBox(cb: _getDressedTypeActive[5]),
          _buildSingleCheckBox(cb: _getDressedTypeActive[6]),
          _buildColumnCheckBoxAndChildren(
            cb: (_getDressedTypeActive[7]),
            child: [
              _buildSubSingleCheckBox(
                subCb: (_subGetDressedTypeActive[0]),
                cb: _getDressedTypeActive[7],
              ),
              _buildSubSingleCheckBox(
                subCb: (_subGetDressedTypeActive[1]),
                cb: _getDressedTypeActive[7],
              ),
            ],
          ),
          _buildSingleCheckBox(cb: _getDressedTypeActive[8]),
        ]),
      ],
    );
  }

  Widget _buildMealAssistantArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '食事介助'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[0]),
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[1]),
          _buildColumnCheckBoxAndChildren(
            cb: _mealAssistanceTypeActive[2],
            child: [
              _buildSingleRowLabelAndInput(
                label: 'CC',
                cb: _mealAssistanceTypeActive[2],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[3]),
          _buildColumnCheckBoxAndChildren(
            cb: _mealAssistanceTypeActive[4],
            child: [
              CustomRadioGroupButtonTwo(
                labels: const ['完食', '残しあり'],
                isChecked: _mealAssistanceTypeActive[4].isChecked,
              ),
              _buildInputGroupWithSlash(
                _mealAssistanceTypeActive[4],
                label: '残量',
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _mealAssistanceTypeActive[5],
            child: [
              _buildSingleRowLabelAndMultiLinesInput(
                label: '',
                cb: _mealAssistanceTypeActive[5],
                onChanged: (v) {},
              ),
            ],
          ),
        ]),
      ],
    );
  }

  Widget _buildExcretionAssistanceArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeadingLabel(label: '身体介護'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _excretionAssistanceTypeActive[0]),
          _buildSingleCheckBox(cb: _excretionAssistanceTypeActive[1]),
          _buildSingleCheckBox(cb: _excretionAssistanceTypeActive[2]),
          _buildSingleCheckBox(cb: _excretionAssistanceTypeActive[3]),
          _buildSingleCheckBox(cb: _excretionAssistanceTypeActive[4]),
          _buildColumnCheckBoxAndChildren(
            cb: _excretionAssistanceTypeActive[5],
            child: [
              _buildSingleMultiLinesInputWithHintLabel(
                hintLabel: '状態',
                cb: _excretionAssistanceTypeActive[5],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _excretionAssistanceTypeActive[6],
            child: [
              _buildSingleMultiLinesInputWithHintLabel(
                hintLabel: '状態',
                cb: _excretionAssistanceTypeActive[6],
                onChanged: (v) {},
              ),
            ],
          ),
          _buildSingleCheckBox(cb: _excretionAssistanceTypeActive[7]),
        ]),
      ],
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
              maxLines: 3,
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

  Widget _buildSubSingleCheckBox(
      {required CheckBoxModel subCb, required CheckBoxModel cb}) {
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
        color: !cb.isChecked ? AppColors.disabledColor : AppColors.whiteColor,
        child: CheckboxListTile(
          contentPadding: const EdgeInsets.only(left: 34.0),
          title: Container(
            constraints: const BoxConstraints(maxWidth: 208.0),
            child: Text(
              subCb.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                height: 1.2,
                color: !cb.isChecked
                    ? AppColors.disableTextColor
                    : AppColors.blackColor,
              ),
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: subCb.isChecked,
          activeColor: AppColors.primaryColor,
          onChanged: cb.isChecked
              ? (value) {
                  setState(() {
                    subCb.isChecked = value!;
                  });
                }
              : null,
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
            height: 1.2,
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
            // height: 58.0,
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
            // height: 58.0,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildInputGroupWithSlash(CheckBoxModel cb, {String label = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 41.0),
          _buildRowLabelAndInputWithSlash(
            label: label,
            cb: cb,
            onChanged: (v) {},
          ),
          const SizedBox(width: 15.5),
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
          const SizedBox(width: 11.5),
          _buildRowLabelAndInputWithSlash(
            label: '',
            cb: cb,
            onChanged: (v) {},
          ),
        ],
      ),
    );
  }

  Widget _buildSingleMultiLinesInputWithHintLabel(
      {required String hintLabel,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 41.0),
          Expanded(
            child: SizedBox(
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
          ),
          const SizedBox(width: 18.0),
        ],
      ),
    );
  }

  Widget _buildSingleRowLabelAndInput(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildSingleColumLabelAndInput(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSubLabel(label: label, isChecked: cb.isChecked),
          SizedBox(
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
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget _buildSingleRowLabelAndMultiLinesInput(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 41.0),
          _buildSubLabel(label: label),
          const SizedBox(width: 6.0),
          Expanded(
            child: SizedBox(
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
          ),
          const SizedBox(width: 18.0),
        ],
      ),
    );
  }

  Widget _buildSingleColumLabelAndInputWithoutCheckBox(
      {required String label, required Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeadingLabel(label: label),
          Container(
            color: AppColors.whiteColor,
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
              autofocus: false,
              minLines: 2,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              onChanged: onChanged,
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
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

  Widget _buildRowLabelAndInputWithSlash(
      {required String label,
      required CheckBoxModel cb,
      required Function(String)? onChanged}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSubLabel(label: label, isChecked: cb.isChecked),
        const SizedBox(width: 5.0),
        SizedBox(
          width: 80.0,
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
