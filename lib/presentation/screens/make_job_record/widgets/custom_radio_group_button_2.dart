import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/types.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 30.0),
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
            _buildSubLabel(label: widget.labels[0]),
          ],
        ),
        const SizedBox(width: 8.0),
        Row(
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
            _buildSubLabel(label: widget.labels[1]),
          ],
        ),
      ],
    );
  }

  Widget _buildSubLabel({required label}) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'NotoSanJP',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
    );
  }
}
