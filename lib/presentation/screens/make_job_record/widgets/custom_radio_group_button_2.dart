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

  _onChanged(String? value) {
    setState(() => groupValue = value!);
  }

  @override
  void didUpdateWidget(covariant CustomRadioGroupButtonTwo oldWidget) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 35.0),
          InkWell(
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
                            if (widget.isChecked) {
                              _onChanged(value);
                            }
                          }
                        : null),
                _buildSubLabel(
                    label: widget.labels[0], isChecked: widget.isChecked),
              ],
            ),
          ),
          widget.labels[1].length > 4
              ? SizedBox(width: 15.0)
              : SizedBox(width: 50.0),
          Expanded(
            child: InkWell(
              onTap: () {
                if (widget.labels[1] != groupValue && widget.isChecked) {
                  _onChanged(widget.labels[1]);
                } else {
                  _onChanged('');
                  return null;
                }
              },
              child: Row(
                children: [
                  Radio(
                      value: widget.labels[1],
                      groupValue: groupValue,
                      onChanged: widget.isChecked
                          ? (String? value) {
                              if (widget.isChecked) {
                                _onChanged(value);
                              }
                            }
                          : null),
                  _buildSubLabel(
                      label: widget.labels[1], isChecked: widget.isChecked),
                ],
              ),
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
