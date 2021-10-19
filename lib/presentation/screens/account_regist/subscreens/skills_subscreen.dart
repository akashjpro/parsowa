import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/account_regist/data/data.dart';
import 'package:parsowa/presentation/screens/account_regist/subscreens/image_attach_subscreen.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/check_box_model.dart';

class SkillsSubScreen extends StatefulWidget {
  const SkillsSubScreen({Key? key}) : super(key: key);

  @override
  _SkillsSubScreenState createState() => _SkillsSubScreenState();
}

class _SkillsSubScreenState extends State<SkillsSubScreen> {
  final _formKey = GlobalKey<FormState>();

  final _yearsOfExpController = TextEditingController();
  final _selfPrController = TextEditingController();

  onNextPress() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ImageAttachSubScreen(),
        ),
      );
    }
  }

  String? isEmptyValidator(String? v) {
    if (v!.isEmpty) {
      return 'Required.';
    }
    return null;
  }

  @override
  void dispose() {
    _yearsOfExpController.dispose();
    _selfPrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        color: Colors.amber,
                        child: Center(child: Text('Image Processing')),
                      ),
                      Expanded(
                        child: Container(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ..._buildExperiencesSection(),
                                ..._buildQualificationsSection(),
                                const SizedBox(height: 15.0),
                                ..._buildSelfPrSection(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      _buildBottomButtonSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSelfPrSection() {
    return [
      _buildHeading(title: '自己PR(任意)'),
      const SizedBox(height: 15.0),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: TextFormField(
          controller: _selfPrController,
          validator: isEmptyValidator,
          keyboardType: TextInputType.multiline,
          decoration: _buildInputDecoration(hint: '過去の業務歴、経験などをお書きください'),
          autofocus: false,
          minLines: 3,
          maxLines: null,
        ),
      ),
    ];
  }

  List<Widget> _buildQualificationsSection() {
    return [
      _buildHeading(title: '保有資格'),
      const SizedBox(height: 15.0),
      _buildCustomContainer(
        haveQualifications.map((e) => _buildSingleCheckBox(cb: e)).toList(),
      ),
    ];
  }

  List<Widget> _buildExperiencesSection() {
    return [
      _buildHeading(title: '介護経験年数(Parsowa登録時)'),
      _buildRowLabelAndTextField(
        label: '年',
        controller: _yearsOfExpController,
        validator: isEmptyValidator,
      ),
    ];
  }

  Widget _buildRowLabelAndTextField({
    String label = '',
    required TextEditingController controller,
    required String? Function(String? v) validator,
  }) {
    return Container(
      constraints: BoxConstraints(minWidth: 100.0, minHeight: 40.0),
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
            child: _buildTextFormField(
              validator: validator,
              controller: controller,
            ),
          ),
          const SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              height: -0.25,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
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

  InputDecoration _buildInputDecoration({String hint = ''}) {
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
      hintText: hint,
      helperText: '  ',
      contentPadding: EdgeInsets.all(10.0),
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
      margin: const EdgeInsets.symmetric(horizontal: 38.0),
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
}
