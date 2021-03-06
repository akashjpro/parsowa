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
  static const String routeName = "/MakeJobRecord";

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

  // controllers

  // ServiceType Section
  final _numberOfTimesOfPhysicalCareController = TextEditingController();
  final _numberOfTimesOfLifeCareController = TextEditingController();
  final _numberOfMinutesOfSupportOfCarGettingOnOrOffController =
      TextEditingController();
  final _numberOfMinutesOfPhysicalCareController = TextEditingController();
  final _numberOfMinutesOfHouseworkAssistanceController =
      TextEditingController();
  final _numberOfMinutesOfFullCareForServiceDisabilitiesController =
      TextEditingController();
  final _numberOfMinutesOfActionSupportController = TextEditingController();
  final _numberOfMinutesOfAccompanyingSupportController =
      TextEditingController();
  final _numberOfMinutesOfAssistanceWhenGoingToHospitalController =
      TextEditingController();
  final _mituneController = TextEditingController();
  final _destinationInputController = TextEditingController();

  // AdvanceCheck Section
  final _complextionStatusController = TextEditingController();
  final _sweatingStatusController = TextEditingController();
  final _bodyTemperatureController = TextEditingController();
  final _bloodPressureHighestController = TextEditingController();
  final _bloodPressureLowestController = TextEditingController();

  // BodyCare Section
  final _urineStatusController = TextEditingController();
  final _fecesStatusController = TextEditingController();
  final _hydrationAmountController = TextEditingController();
  final _leftOverFoodAmountNumeratorController = TextEditingController();
  final _leftOverFoodAmountDenomiratorController = TextEditingController();
  final _noTableCookingController = TextEditingController();

  // LivingAssistance Section
  final _mealsMenuController = TextEditingController();

  // ShopingRecord Section
  final _receivedAmountController = TextEditingController();
  final _spendAmountController = TextEditingController();
  final _detailController = TextEditingController();

  _disposeAllController() {
    _numberOfTimesOfPhysicalCareController.dispose();
    _numberOfTimesOfLifeCareController.dispose();
    _numberOfMinutesOfSupportOfCarGettingOnOrOffController.dispose();
    _numberOfMinutesOfPhysicalCareController.dispose();
    _numberOfMinutesOfHouseworkAssistanceController.dispose();
    _numberOfMinutesOfFullCareForServiceDisabilitiesController.dispose();
    _numberOfMinutesOfActionSupportController.dispose();
    _numberOfMinutesOfAssistanceWhenGoingToHospitalController.dispose();
    _numberOfMinutesOfAccompanyingSupportController.dispose();
    _mituneController.dispose();
    _destinationInputController.dispose();

    _complextionStatusController.dispose();
    _sweatingStatusController.dispose();
    _bodyTemperatureController.dispose();
    _bloodPressureHighestController.dispose();
    _bloodPressureLowestController.dispose();

    _urineStatusController.dispose();
    _fecesStatusController.dispose();
    _hydrationAmountController.dispose();
    _leftOverFoodAmountNumeratorController.dispose();
    _leftOverFoodAmountDenomiratorController.dispose();
    _noTableCookingController.dispose();

    _mealsMenuController.dispose();

    _receivedAmountController.dispose();
    _spendAmountController.dispose();
    _detailController.dispose();
  }

  @override
  void dispose() {
    _disposeAllController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarCustom(
          stringTitle: '??????????????????????????????',
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

  Widget _buildExpansionSection() {
    return Column(
      children: [
        const Divider(
          height: 1.0,
          thickness: 0.8,
          color: AppColors.borderColor,
        ),
        CustomExpansionPanelList(
          elevation: 0.0,
          expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 12.0),
          dividerColor: AppColors.lineStandardColor,
          children: [
            _buildSingleExpansionPanel(
              index: 0,
              label: '?????????????????????',
              body: _buildServiceTypeSection(),
            ),
            _buildSingleExpansionPanel(
              index: 1,
              label: '?????????????????????????????????',
              body: _buildAdvanceCheckSection(),
            ),
            _buildSingleExpansionPanel(
              index: 2,
              label: '????????????',
              body: _buildBodyCareSection(),
            ),
            _buildSingleExpansionPanel(
              index: 3,
              label: '????????????',
              body: _buildLivingAssistanceSection(),
            ),
            _buildSingleExpansionPanel(
              index: 4,
              label: '????????????',
              body: _buildShoppingRecordSection(),
            ),
            _buildSingleExpansionPanel(
              index: 5,
              label: '????????????',
              body: _buildExitConfirmingSection(),
            ),
            _buildSingleExpansionPanel(
              index: 6,
              label: '?????????????????????',
              body: _buildNoteSection(),
            ),
          ],
          expansionCallback: (i, isOpen) =>
              setState(() => _isOpenExpandPanels[i] = !isOpen),
        ),
        !_isOpenExpandPanels[6]
            ? const Divider(
                height: 1.0,
                thickness: 0.8,
                color: AppColors.borderColor,
              )
            : SizedBox.shrink(),
      ],
    );
  }

  Widget _buildAdvanceCheckSection() {
    return Column(
      children: [
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
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
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
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
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
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
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
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
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
        ),
        const SizedBox(height: 15.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 25.0),
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                  autofocus: false,
                  minLines: 4,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (v) {},
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
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
                title: '????????????',
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

  Widget _buildShoppingRecordSection() {
    return Column(
      children: [
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
          child: _buildSubContainerInsideExpansion(
            Column(
              children: [
                _buildRowAmountInput(
                  label: '?????????',
                  controller: _receivedAmountController,
                ),
                const SizedBox(height: 20.0),
                _buildRowAmountInput(
                  label: '?????????',
                  controller: _spendAmountController,
                ),
                const SizedBox(height: 20.0),
                const Divider(
                  color: AppColors.borderColor,
                  height: 1.0,
                  thickness: 1.0,
                ),
                _buildRowSpendTotal(),
                const SizedBox(height: 20.0),
                const DottedLine(
                  dashColor: AppColors.borderColor,
                  dashLength: 1.0,
                  dashGapLength: 1.5,
                ),
                _buildSingleColumLabelAndInputWithoutCheckBox(
                  label: '??????',
                  controller: _detailController,
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
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
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
        _buildHeadingLabel(label: '?????????'),
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
          '???',
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
      {required String label, required TextEditingController controller}) {
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
              controller: controller,
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
            ),
          ),
        ),
        const SizedBox(width: 6.6),
        const Text(
          '???',
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
        _buildHeadingLabel(label: '?????????'),
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
        _buildHeadingLabel(label: '???????????????'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _preparingMealTypeActive[0]),
          _buildSingleCheckBox(cb: _preparingMealTypeActive[1]),
          _buildSingleCheckBox(cb: _preparingMealTypeActive[2]),
          _buildSingleCheckBox(cb: _preparingMealTypeActive[3]),
          _buildColumnCheckBoxAndChildren(
            cb: _preparingMealTypeActive[4],
            child: [
              _buildSingleColumLabelAndInput(
                label: '??????',
                cb: _preparingMealTypeActive[4],
                controller: _mealsMenuController,
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
        _buildHeadingLabel(label: '??????'),
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
        _buildHeadingLabel(label: '??????????????????'),
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
        _buildHeadingLabel(label: '??????'),
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
        _buildHeadingLabel(label: '??????'),
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
        _buildHeadingLabel(label: '????????????'),
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
        _buildHeadingLabel(label: '?????????????????????'),
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
        _buildHeadingLabel(label: '???????????????'),
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
        _buildHeadingLabel(label: '???????????????'),
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
        _buildHeadingLabel(label: '???????????????????????????'),
        _buildCustomContainer([
          _buildColumnCheckBoxAndChildren(
            cb: _getDressedTypeActive[0],
            child: [
              CustomRadioGroupButtonTwo(
                  labels: const ['??????', '??????'],
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
                  labels: const ['??????', '???????????????'],
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
        _buildHeadingLabel(label: '????????????'),
        _buildCustomContainer([
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[0]),
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[1]),
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[2]),
          _buildColumnCheckBoxAndChildren(
            cb: _mealAssistanceTypeActive[3],
            child: [
              _buildSingleRowLabelAndInput(
                label: 'CC',
                cb: _mealAssistanceTypeActive[3],
                controller: _hydrationAmountController,
              ),
            ],
          ),
          _buildSingleCheckBox(cb: _mealAssistanceTypeActive[4]),
          _buildColumnCheckBoxAndChildren(
            cb: _mealAssistanceTypeActive[5],
            child: [
              CustomRadioGroupButtonTwo(
                labels: const ['??????', '????????????'],
                isChecked: _mealAssistanceTypeActive[5].isChecked,
              ),
              _buildInputGroupWithSlash(
                _mealAssistanceTypeActive[5],
                [
                  _leftOverFoodAmountNumeratorController,
                  _leftOverFoodAmountDenomiratorController
                ],
                label: '??????',
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _mealAssistanceTypeActive[6],
            child: [
              _buildSingleRowLabelAndMultiLinesInput(
                label: '',
                cb: _mealAssistanceTypeActive[6],
                controller: _noTableCookingController,
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
        _buildHeadingLabel(label: '????????????'),
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
                hintLabel: '??????',
                cb: _excretionAssistanceTypeActive[5],
                controller: _urineStatusController,
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _excretionAssistanceTypeActive[6],
            child: [
              _buildSingleMultiLinesInputWithHintLabel(
                hintLabel: '??????',
                cb: _excretionAssistanceTypeActive[6],
                controller: _fecesStatusController,
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
        _buildHeadingLabel(label: '??????????????????'),
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
        _buildHeadingLabel(label: '????????????'),
        _buildCustomContainer(
          [
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[0],
              child: [
                _buildSingleMultiLinesInputWithHintLabel(
                  hintLabel: '??????',
                  cb: _physicalConRecType.physicalConRecType[0],
                  controller: _complextionStatusController,
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[1],
              child: [
                _buildSingleMultiLinesInputWithHintLabel(
                  hintLabel: '??????',
                  cb: _physicalConRecType.physicalConRecType[1],
                  controller: _sweatingStatusController,
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[2],
              child: [
                _buildSingleRowLabelAndInput(
                  label: '???',
                  cb: _physicalConRecType.physicalConRecType[2],
                  controller: _bodyTemperatureController,
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _physicalConRecType.physicalConRecType[3],
              child: [
                _buildInputGroupWithSlash(
                    _physicalConRecType.physicalConRecType[3], [
                  _bloodPressureHighestController,
                  _bloodPressureLowestController
                ]),
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
      _buildLabel(label: '?????????????????????'),
      _buildNonInsuranceServiceFormInput(),
    ].toList();
  }

  List<Widget> _buildChangesArea() {
    return <Widget>[
      _buildLabel(label: '????????????'),
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
      _buildLabel(label: '????????????'),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(maxHeight: 72.0, minHeight: 52.0),
        color: AppColors.whiteColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: cb.isChecked,
              activeColor: AppColors.primaryColor,
              onChanged: (value) {
                setState(() {
                  cb.isChecked = value!;
                });
              },
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 250.0),
              child: Text(
                cb.title,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: 'NotoSanJP',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  height: 1.2,
                ),
              ),
            ),
          ],
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
        _buildHeadingLabel(label: '??????????????????'),
        _buildCustomContainer([
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForCommunityLifeTypeActive
                .serviceForCommunityLifeType[0],
            child: [
              CustomRadioGroupButtonTwo(
                  labels: const ['????????????', '??????????????????'],
                  isChecked: _serviceForCommunityLifeTypeActive
                      .serviceForCommunityLifeType[0].isChecked),
              _buildSingleRowLabelAndInput(
                  label: '???',
                  cb: _serviceForCommunityLifeTypeActive
                      .serviceForCommunityLifeType[0],
                  controller: _mituneController),
              _buildSingleRowLabelAndMultiLinesInput(
                label: '??????',
                cb: _serviceForCommunityLifeTypeActive
                    .serviceForCommunityLifeType[0],
                controller: _destinationInputController,
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
        _buildHeadingLabel(label: '?????????????????????'),
        _buildCustomContainer([
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[0],
            child: [
              _buildSingleRowLabelAndInput(
                  label: '???',
                  cb: _serviceForDisableTypeActive
                      .serviceForDisableTypeChoices[0],
                  controller: _numberOfMinutesOfPhysicalCareController),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[1],
            child: [
              _buildSingleRowLabelAndInput(
                label: '???',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[1],
                controller: _numberOfMinutesOfHouseworkAssistanceController,
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[2],
            child: [
              _buildSingleRowLabelAndInput(
                label: '???',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[2],
                controller:
                    _numberOfMinutesOfFullCareForServiceDisabilitiesController,
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[3],
            child: [
              _buildSingleRowLabelAndInput(
                label: '???',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[3],
                controller: _numberOfMinutesOfActionSupportController,
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[4],
            child: [
              CustomRadioGroupButtonTwo(
                isChecked: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[4].isChecked,
                labels: const ['????????????', '??????????????????'],
              ),
              _buildSingleRowLabelAndInput(
                label: '???',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[4],
                controller: _numberOfMinutesOfAccompanyingSupportController,
              ),
            ],
          ),
          _buildColumnCheckBoxAndChildren(
            cb: _serviceForDisableTypeActive.serviceForDisableTypeChoices[5],
            child: [
              CustomRadioGroupButtonTwo(
                isChecked: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[5].isChecked,
                labels: const ['????????????', '??????????????????'],
              ),
              _buildSingleRowLabelAndInput(
                label: '???',
                cb: _serviceForDisableTypeActive
                    .serviceForDisableTypeChoices[5],
                controller:
                    _numberOfMinutesOfAssistanceWhenGoingToHospitalController,
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
        _buildHeadingLabel(label: '????????????'),
        _buildCustomContainer(
          [
            _buildColumnCheckBoxAndChildren(
              cb: _visitTypeActive.visitChoices[0],
              child: [
                CustomRadioGroupButtonThree(
                  isChecked: _visitTypeActive.visitChoices[0].isChecked,
                  labels: ['I', 'II', 'III'],
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _visitTypeActive.visitChoices[1],
              child: [
                CustomRadioGroupButtonThree(
                  isChecked: _visitTypeActive.visitChoices[1].isChecked,
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
        _buildHeadingLabel(label: '??????????????????'),
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
                  labels: const ["45?????????", "45?????????"],
                ),
              ],
            ),
            _buildColumnCheckBoxAndChildren(
              cb: _serviceTypeActive.careChoices[2],
              child: [
                CustomRadioGroupButtonTwo(
                  isChecked: _serviceTypeActive.careChoices[2].isChecked,
                  labels: const ["??????", "??????"],
                ),
                // const DottedLine(dashColor: AppColors.borderColor),
                _buildSingleRowLabelAndInput(
                  label: '???',
                  cb: _serviceTypeActive.careChoices[2],
                  controller:
                      _numberOfMinutesOfSupportOfCarGettingOnOrOffController,
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
            color:
                !cb.isChecked ? AppColors.disabledColor : AppColors.whiteColor,
            child: e,
          ),
        );
        newChild.add(
          const DottedLine(
            dashColor: AppColors.borderColor,
            dashLength: 1.0,
            dashGapLength: 1.5,
          ),
        );
      }
      newChild.removeLast();
    } else {
      for (var e in child) {
        newChild.add(
          Container(
            // height: 58.0,
            color:
                !cb.isChecked ? AppColors.disabledColor : AppColors.whiteColor,
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
        const DottedLine(
          dashColor: AppColors.borderColor,
          dashLength: 1.0,
          dashGapLength: 1.5,
        ),
        ...newChild
      ],
    );
  }

  Widget _buildInputGroup(CheckBoxModel cb) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 41.0),
          _buildRowLabelAndInput(
            label: '??????',
            cb: cb,
            controller: _numberOfTimesOfPhysicalCareController,
          ),
          const SizedBox(width: 18.0),
          _buildRowLabelAndInput(
            label: '??????',
            cb: cb,
            controller: _numberOfTimesOfLifeCareController,
          ),
        ],
      ),
    );
  }

  Widget _buildInputGroupWithSlash(
      CheckBoxModel cb, List<TextEditingController> listController,
      {String label = ''}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 41.0),
          _buildRowLabelAndInputWithSlash(
            label: label,
            cb: cb,
            controller: listController[0],
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
            controller: listController[1],
          ),
        ],
      ),
    );
  }

  Widget _buildSingleMultiLinesInputWithHintLabel(
      {required String hintLabel,
      required CheckBoxModel cb,
      required TextEditingController controller}) {
    if (!cb.isChecked) {
      controller.clear();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 41.0),
          Expanded(
            child: SizedBox(
              height: 38.0,
              child: TextField(
                controller: controller,
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
      required TextEditingController controller}) {
    if (!cb.isChecked) {
      controller.clear();
    }

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
              controller: controller,
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
      required TextEditingController controller}) {
    if (!cb.isChecked) {
      controller.clear();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSubLabel(label: label, isChecked: cb.isChecked),
          SizedBox(
            height: 38.0,
            child: TextField(
              controller: controller,
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
      required TextEditingController controller}) {
    if (!cb.isChecked) {
      controller.clear();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                controller: controller,
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
              ),
            ),
          ),
          const SizedBox(width: 18.0),
        ],
      ),
    );
  }

  Widget _buildSingleColumLabelAndInputWithoutCheckBox(
      {required String label, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeadingLabel(label: label),
          Container(
            color: AppColors.whiteColor,
            child: TextField(
              controller: controller,
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
      required TextEditingController controller}) {
    if (!cb.isChecked) {
      controller.clear();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSubLabel(label: label, isChecked: cb.isChecked),
        const SizedBox(width: 5.0),
        SizedBox(
          width: 70.0,
          height: 38.0,
          child: TextField(
              controller: controller,
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
              onChanged: (String v) {}),
        ),
      ],
    );
  }

  Widget _buildRowLabelAndInputWithSlash(
      {required String label,
      required CheckBoxModel cb,
      required TextEditingController controller}) {
    if (!cb.isChecked) {
      controller.clear();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSubLabel(label: label, isChecked: cb.isChecked),
        const SizedBox(width: 5.0),
        SizedBox(
          width: 80.0,
          height: 38.0,
          child: TextField(
            controller: controller,
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
          ),
        ),
      ],
    );
  }
}
