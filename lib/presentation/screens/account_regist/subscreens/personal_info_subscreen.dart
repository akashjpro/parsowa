import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/account_regist/data/data.dart';
import 'package:parsowa/presentation/screens/account_regist/subscreens/skills_subscreen.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_description.dart';
import 'package:parsowa/presentation/screens/account_regist/widgets/custom_title.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalInfoSubScreen extends StatefulWidget {
  const PersonalInfoSubScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoSubScreenState createState() => _PersonalInfoSubScreenState();
}

class _PersonalInfoSubScreenState extends State<PersonalInfoSubScreen> {
  final _formKey = GlobalKey<FormState>();

  final _familyNameController = TextEditingController();
  final _firstNameController = TextEditingController();

  final _furiganaFamilyNameController = TextEditingController();
  final _furiganaFirstNameController = TextEditingController();

  final _postalCode1Controller = TextEditingController();
  final _postalCode2Controller = TextEditingController();

  final _cityNameController = TextEditingController();
  final _buildingNameController = TextEditingController();

  final _phoneNumber1Controller = TextEditingController();
  final _phoneNumber2Controller = TextEditingController();
  final _phoneNumber3Controller = TextEditingController();

  int? _selectedYearDropDownValue;
  int? _selectedMonthDropDownValue;
  int? _selectedDayDropDownValue;
  String? _selectedPrefectureDropDownValue;

  final List<String> sex = ['男性', '女性'];
  String _choosenSex = '';

  onNextPress() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => SkillsSubScreen(),
        ),
      );
    }
  }

  onTapLaunchHyperlink() async {
    final url = '';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
      );
    }
  }

  String? isEmptyValidator(String? v) {
    if (v!.isEmpty) {
      return 'Required.';
    }
    return null;
  }

  disposeAll() {
    _familyNameController.dispose();
    _firstNameController.dispose();
    _furiganaFamilyNameController.dispose();
    _furiganaFirstNameController.dispose();
    _postalCode1Controller.dispose();
    _postalCode2Controller.dispose();
    _cityNameController.dispose();
    _buildingNameController.dispose();
    _phoneNumber1Controller.dispose();
    _phoneNumber2Controller.dispose();
    _phoneNumber3Controller.dispose();
  }

  @override
  void dispose() {
    disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: new AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.0),
                  child: Center(
                    child: Image.asset(
                      'assets/progress_display/Progress_display_03.png',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 38.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CustomTitle(title: '個人詳細情報登録'),
                      const SizedBox(height: 15.0),
                      const CustomDescription(
                        description:
                            '登録完了後、TCI株式会社が審査を行います。\n審査に通過後、Parsowaを利用できるようになります。',
                      ),
                      const SizedBox(height: 35.0),
                      _buildHandlingPersonalInformationText(),
                      const SizedBox(height: 15.0),
                      _buildPrivacyPolicy(),
                      const SizedBox(height: 45.0),
                    ],
                  ),
                ),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ..._buildNameSection(),
                        ..._buildFuriganaSection(),
                        ..._buildSexSection(),
                        ..._buildBirthdaySection(),
                        ..._buildLastSection(),
                      ],
                    ),
                  ),
                ),
                _buildBottomButtonSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLastSection() {
    return [
      _buildHeading(title: '住所'),
      const SizedBox(height: 15.0),
      _buildSubLabel(label: '郵便番号'),
      const SizedBox(height: 5.0),
      _buildRowSingleLabelAndTextField(
        firstController: _postalCode1Controller,
        secondController: _postalCode2Controller,
        label: 'ー',
        firstValidator: isEmptyValidator,
        secondValidator: isEmptyValidator,
      ),
      _buildSubLabel(label: '都道府県'),
      const SizedBox(height: 5.0),
      _buildDropDownPrefecture(),
      const SizedBox(height: 15.0),
      _buildSubLabel(label: '市区町村'),
      const SizedBox(height: 5.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: _buildTextFormField(
            controller: _cityNameController, validator: isEmptyValidator),
      ),
      _buildSubLabel(label: 'マンション名(任意)'),
      const SizedBox(height: 5.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: _buildTextFormField(
          controller: _buildingNameController,
          validator: isEmptyValidator,
        ),
      ),
      _buildSubLabel(label: '電話番号'),
      const SizedBox(height: 5.0),
      _buildRowTripleLabelAndTextField(
        firstController: _phoneNumber1Controller,
        secondController: _phoneNumber2Controller,
        thirdController: _phoneNumber3Controller,
        label: 'ー',
        firstValidator: isEmptyValidator,
        secondValidator: isEmptyValidator,
        thirdValidator: isEmptyValidator,
      ),
      const SizedBox(height: 25.0),
    ];
  }

  List<Widget> _buildBirthdaySection() {
    return [
      _buildHeading(title: '生年月日'),
      Container(
        margin: EdgeInsets.only(
          left: 38.0,
          right: 38.0,
          top: 15.0,
          bottom: 23.0,
        ),
        child: Row(
          children: [
            _buildDropDownYear(),
            const SizedBox(width: 15.0),
            _buildDropDownMonth(),
            const SizedBox(width: 15.0),
            _buildDropDownDay(),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildNameSection() {
    return [
      _buildHeading(title: 'お名前'),
      _buildRowLabelAndTextField(
        firstLabel: '    姓：',
        secondLabel: '    名：',
        firstController: _familyNameController,
        secondController: _firstNameController,
        firstValidator: isEmptyValidator,
        secondValidator: isEmptyValidator,
      ),
    ];
  }

  List<Widget> _buildFuriganaSection() {
    return [
      _buildHeading(title: 'フリガナ'),
      _buildRowLabelAndTextField(
        firstLabel: 'セイ：',
        secondLabel: 'メイ：',
        firstController: _furiganaFamilyNameController,
        secondController: _furiganaFirstNameController,
        firstValidator: isEmptyValidator,
        secondValidator: isEmptyValidator,
      ),
    ];
  }

  List<Widget> _buildSexSection() {
    return [
      _buildHeading(title: '性別'),
      _buildGroupButtonFormField(),
    ];
  }

  Widget _buildSubLabel({required label}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 38.0,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'NotoSanJP',
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _buildRowTripleLabelAndTextField({
    String label = '',
    required TextEditingController firstController,
    required TextEditingController secondController,
    required TextEditingController thirdController,
    required String? Function(String? v) firstValidator,
    required String? Function(String? v) secondValidator,
    required String? Function(String? v) thirdValidator,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 40.0),
      margin: const EdgeInsets.only(
        left: 38.0,
        right: 38.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _buildTextFormField(
              keyboardType: TextInputType.number,
              validator: firstValidator,
              controller: firstController,
            ),
          ),
          const SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              height: -0.5,
            ),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: _buildTextFormField(
              keyboardType: TextInputType.number,
              validator: secondValidator,
              controller: secondController,
            ),
          ),
          const SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              height: -0.5,
            ),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: _buildTextFormField(
              keyboardType: TextInputType.number,
              validator: thirdValidator,
              controller: thirdController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowSingleLabelAndTextField({
    String label = '',
    required TextEditingController firstController,
    required TextEditingController secondController,
    required String? Function(String? v) firstValidator,
    required String? Function(String? v) secondValidator,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 40.0),
      margin: const EdgeInsets.only(
        left: 38.0,
        right: 38.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 73.0),
            child: _buildTextFormField(
              validator: firstValidator,
              controller: firstController,
            ),
          ),
          const SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
              height: -0.5,
            ),
          ),
          const SizedBox(width: 5.0),
          Container(
            constraints: BoxConstraints(maxWidth: 103.0),
            child: _buildTextFormField(
              validator: secondValidator,
              controller: secondController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropDownPrefecture() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(left: 38.0),
            constraints: BoxConstraints(
              maxWidth: 103.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: _selectedPrefectureDropDownValue == null
                    ? AppColors.borderColor
                    : AppColors.primaryColor,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            child: ButtonTheme(
              alignedDropdown: true,
              minWidth: 103.0,
              child: DropdownButton<String>(
                items: List<DropdownMenuItem<String>>.generate(
                  prefecture.length,
                  (index) => DropdownMenuItem(
                    value: prefecture[index],
                    child: Text(
                      '${prefecture[index]}',
                      style: const TextStyle(
                        fontFamily: 'NotoSanJP',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
                isExpanded: true,
                underline: Container(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.blackColor,
                ),
                elevation: 1,
                value: _selectedPrefectureDropDownValue,
                onChanged: (value) {
                  setState(() {
                    _selectedPrefectureDropDownValue = value!;
                  });
                },
              ),
            ),
          ),
        ),
        const Spacer(flex: 2),
        const Spacer(),
      ],
    );
  }

  Widget _buildDropDownDay() {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 83.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: _selectedDayDropDownValue == null
                  ? AppColors.borderColor
                  : AppColors.primaryColor,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<int>(
              items: List<DropdownMenuItem<int>>.generate(
                32,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              isExpanded: true,
              underline: Container(),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.blackColor,
              ),
              elevation: 1,
              value: _selectedDayDropDownValue,
              onChanged: (value) {
                setState(() {
                  _selectedDayDropDownValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropDownMonth() {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 83.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: _selectedMonthDropDownValue == null
                  ? AppColors.borderColor
                  : AppColors.primaryColor,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<int>(
              items: List<DropdownMenuItem<int>>.generate(
                13,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              isExpanded: true,
              underline: Container(),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.blackColor,
              ),
              elevation: 1,
              value: _selectedMonthDropDownValue,
              onChanged: (value) {
                setState(() {
                  _selectedMonthDropDownValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropDownYear() {
    return Row(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 103.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: _selectedYearDropDownValue == null
                  ? AppColors.borderColor
                  : AppColors.primaryColor,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<int>(
              items: List<DropdownMenuItem<int>>.generate(
                56,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(
                    '${2021 - 70 + index}',
                    style: const TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              isExpanded: true,
              underline: Container(),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.blackColor,
              ),
              elevation: 1,
              value: _selectedYearDropDownValue,
              onChanged: (value) {
                setState(() {
                  _selectedYearDropDownValue = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  FormField<String> _buildGroupButtonFormField() {
    return FormField(
      builder: (FormFieldState<String> state) {
        return Column(
          children: [
            _buildGroupRadioButton(state),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: state.hasError
                  ? Text(
                      state.errorText!,
                      style: TextStyle(color: AppColors.errorColor),
                    )
                  : Container(),
            ),
          ],
        );
      },
      validator: (String? v) {
        if (v == null || v != _choosenSex) {
          return 'Required.';
        }
        return null;
      },
    );
  }

  Widget _buildGroupRadioButton(FormFieldState<String> state) {
    return Container(
      constraints: BoxConstraints(maxHeight: 52.0),
      margin: const EdgeInsets.only(
        left: 38.0,
        right: 38.0,
        top: 15.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: state.hasError
              ? AppColors.errorColor
              : _choosenSex.isEmpty
                  ? AppColors.borderColor
                  : AppColors.primaryColor,
        ),
        color: state.hasError ? AppColors.errorBackgroundColor : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                if (sex[0] != _choosenSex) {
                  setState(() {
                    _choosenSex = sex[0];
                    state.setValue(_choosenSex);
                  });
                }
              },
              child: Row(
                children: [
                  Radio(
                    value: sex[0],
                    groupValue: _choosenSex,
                    onChanged: (String? value) {
                      setState(() {
                        _choosenSex = sex[0];
                        state.setValue(_choosenSex);
                      });
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
          ),
          const VerticalDivider(
              color: AppColors.verticalSeperator, thickness: 1.0, width: 1.0),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                if (sex[1] != _choosenSex) {
                  setState(() {
                    _choosenSex = sex[1];
                    state.setValue(_choosenSex);
                  });
                }
              },
              child: Row(
                children: [
                  Radio(
                    value: sex[1],
                    groupValue: _choosenSex,
                    onChanged: (String? value) {
                      setState(() {
                        _choosenSex = sex[1];
                        state.setValue(_choosenSex);
                      });
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
          ),
        ],
      ),
    );
  }

  Widget _buildRowLabelAndTextField({
    String firstLabel = '',
    String secondLabel = '',
    required TextEditingController firstController,
    required TextEditingController secondController,
    required String? Function(String? v) firstValidator,
    required String? Function(String? v) secondValidator,
  }) {
    return Container(
      // constraints: BoxConstraints(minWidth: 100.0, minHeight: 40.0),
      margin: const EdgeInsets.only(
        left: 38.0,
        right: 38.0,
        top: 15.0,
        bottom: 5.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  firstLabel,
                  style: TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    height: -0.25,
                  ),
                ),
                Expanded(
                  child: _buildTextFormField(
                    validator: firstValidator,
                    controller: firstController,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  secondLabel,
                  style: TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    height: -0.25,
                  ),
                ),
                Expanded(
                  child: _buildTextFormField(
                    validator: secondValidator,
                    controller: secondController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField({
    required TextEditingController controller,
    required String? Function(String? v) validator,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _buildInputDecoration(),
      autofocus: false,
      validator: validator,
    );
  }

  Widget _buildHeading({required String title}) {
    return Container(
      padding: const EdgeInsets.only(left: 38.0),
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

  RichText _buildPrivacyPolicy() {
    return RichText(
      text: TextSpan(
        text: 'プライバシーポリシー',
        style: TextStyle(
          fontFamily: 'NotoSanJP',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          height: 1.3125,
          color: Colors.amber,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()..onTap = onTapLaunchHyperlink,
      ),
    );
  }

  Text _buildHandlingPersonalInformationText() {
    return const Text(
      '個人情報の取り扱いについて',
      style: TextStyle(
        fontFamily: 'NotoSanJP',
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        height: 0.125,
      ),
    );
  }

  Widget _buildBottomButtonSection() {
    return Container(
      constraints: BoxConstraints(maxHeight: 80.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37.5, vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _buildButton(
                title: '戻る',
                primaryColor: AppColors.whiteColor,
                changeColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: _buildButton(
                  title: '次へ',
                  primaryColor: AppColors.primaryColor,
                  changeColor: AppColors.whiteColor,
                  onPressed: onNextPress),
            ),
          ],
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

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      helperText: '  ',
      contentPadding: EdgeInsets.all(10.0),
    );
  }
}
