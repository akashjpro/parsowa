import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/service_section_types.dart';

class CustomRadioGroupButtonThree extends StatefulWidget {
  final int indexOfListCheck;
  final List<String> labels;

  const CustomRadioGroupButtonThree({
    Key? key,
    required this.indexOfListCheck,
    required this.labels,
  }) : super(key: key);

  @override
  State<CustomRadioGroupButtonThree> createState() =>
      _CustomRadioGroupButtonThreeState();
}

class _CustomRadioGroupButtonThreeState
    extends State<CustomRadioGroupButtonThree> {
  String groupValue = '';
  final _visitTypeActive = VisitType.visitTypeActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 30.0),
          Expanded(
            child: Row(
              children: [
                Radio(
                  value: widget.labels[0],
                  groupValue: groupValue,
                  onChanged: _visitTypeActive
                          .visitChoices[widget.indexOfListCheck].isChecked
                      ? (String? value) {
                          setState(() {
                            groupValue = value!;
                          });
                        }
                      : null,
                ),
                _buildSubLabel(
                    label: widget.labels[0],
                    isChecked: _visitTypeActive
                        .visitChoices[widget.indexOfListCheck].isChecked),
              ],
            ),
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: Row(
              children: [
                Radio(
                  value: widget.labels[1],
                  groupValue: groupValue,
                  onChanged: _visitTypeActive
                          .visitChoices[widget.indexOfListCheck].isChecked
                      ? (String? value) {
                          setState(() => groupValue = value!);
                        }
                      : null,
                ),
                _buildSubLabel(
                    label: widget.labels[1],
                    isChecked: _visitTypeActive
                        .visitChoices[widget.indexOfListCheck].isChecked),
              ],
            ),
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: Row(
              children: [
                Radio(
                  value: widget.labels[2],
                  groupValue: groupValue,
                  onChanged: _visitTypeActive
                          .visitChoices[widget.indexOfListCheck].isChecked
                      ? (String? value) {
                          setState(() => groupValue = value!);
                        }
                      : null,
                ),
                _buildSubLabel(
                    label: widget.labels[2],
                    isChecked: _visitTypeActive
                        .visitChoices[widget.indexOfListCheck].isChecked),
              ],
            ),
          ),
          const SizedBox(width: 18.0),
        ],
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
        height: 1.2,
        color: isChecked ? AppColors.blackColor : AppColors.disableTextColor,
      ),
    );
  }
}
