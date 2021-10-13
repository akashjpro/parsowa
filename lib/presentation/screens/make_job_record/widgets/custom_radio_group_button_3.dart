import 'package:flutter/material.dart';
import 'package:parsowa/presentation/screens/make_job_record/data/types.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 30.0),
        Row(
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
            _buildSubLabel(label: widget.labels[0]),
          ],
        ),
        const SizedBox(width: 18.0),
        Row(
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
            _buildSubLabel(label: widget.labels[1]),
          ],
        ),
        const SizedBox(width: 18.0),
        Row(
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
            _buildSubLabel(label: widget.labels[2]),
          ],
        ),
        const SizedBox(width: 18.0),
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
