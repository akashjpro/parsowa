import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';

class CustomRadioGroupButtonTwo extends StatefulWidget {
  final List<String> labels;
  final bool isChecked;

  const CustomRadioGroupButtonTwo({
    Key? key,
    required this.labels,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<CustomRadioGroupButtonTwo> createState() =>
      _CustomRadioGroupButtonTwoState();
}

class _CustomRadioGroupButtonTwoState extends State<CustomRadioGroupButtonTwo> {
  String groupValue = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 24.0),
          Row(
            children: [
              Radio(
                value: widget.labels[0],
                groupValue: groupValue,
                onChanged: widget.isChecked
                    ? (String? value) {
                        setState(() {
                          groupValue = value!;
                        });
                      }
                    : null,
              ),
              _buildSubLabel(
                  label: widget.labels[0], isChecked: widget.isChecked),
            ],
          ),
          widget.labels[1].length > 5
              ? const SizedBox(width: 0.0)
              : const SizedBox(width: 30.0),
          Expanded(
            child: Row(
              children: [
                Radio(
                  value: widget.labels[1],
                  groupValue: groupValue,
                  onChanged: widget.isChecked
                      ? (String? value) {
                          setState(() => groupValue = value!);
                        }
                      : null,
                ),
                _buildSubLabel(
                    label: widget.labels[1], isChecked: widget.isChecked),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubLabel({required label, bool isChecked = false}) {
    return Text(
      label,
      softWrap: true,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
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
