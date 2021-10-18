import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/service_section_types.dart';

class CustomRadioGroupButtonThree extends StatefulWidget {
  final List<String> labels;
  final bool isChecked;

  const CustomRadioGroupButtonThree({
    Key? key,
    required this.isChecked,
    required this.labels,
  }) : super(key: key);

  @override
  State<CustomRadioGroupButtonThree> createState() =>
      _CustomRadioGroupButtonThreeState();
}

class _CustomRadioGroupButtonThreeState
    extends State<CustomRadioGroupButtonThree> {
  String groupValue = '';

  _onChanged(String? value) {
    setState(() => groupValue = value!);
  }

  @override
  void didUpdateWidget(covariant CustomRadioGroupButtonThree oldWidget) {
    if (oldWidget.isChecked != widget.isChecked) {
      _onChanged('');
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 30.0),
          Expanded(
            child: InkWell(
              onTap: () {
                if (widget.labels[0] != groupValue && widget.isChecked) {
                  _onChanged(widget.labels[0]);
                }
              },
              child: Row(
                children: [
                  Radio(
                    value: widget.labels[0],
                    groupValue: groupValue,
                    onChanged: widget.isChecked
                        ? (String? value) {
                            _onChanged(value);
                          }
                        : null,
                  ),
                  _buildSubLabel(
                      label: widget.labels[0], isChecked: widget.isChecked),
                ],
              ),
            ),
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: InkWell(
              onTap: () {
                if (widget.labels[1] != groupValue && widget.isChecked) {
                  _onChanged(widget.labels[1]);
                }
              },
              child: Row(
                children: [
                  Radio(
                    value: widget.labels[1],
                    groupValue: groupValue,
                    onChanged: widget.isChecked
                        ? (String? value) {
                            _onChanged(value);
                          }
                        : null,
                  ),
                  _buildSubLabel(
                      label: widget.labels[1], isChecked: widget.isChecked),
                ],
              ),
            ),
          ),
          const SizedBox(width: 18.0),
          Expanded(
            child: InkWell(
              onTap: () {
                if (widget.labels[2] != groupValue && widget.isChecked) {
                  _onChanged(widget.labels[2]);
                }
              },
              child: Row(
                children: [
                  Radio(
                    value: widget.labels[2],
                    groupValue: groupValue,
                    onChanged: widget.isChecked
                        ? (String? value) {
                            _onChanged(value);
                          }
                        : null,
                  ),
                  _buildSubLabel(
                      label: widget.labels[2], isChecked: widget.isChecked),
                ],
              ),
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
