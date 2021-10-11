import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final int? value;
  final String? hint;
  final List<DropdownMenuItem<int>>? items;
  final Function? onChanged;

  const CustomDropDown({
    Key? key,
    this.value,
    this.hint,
    this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
            child: DropdownButton<int>(
              value: value,
              // hint: Text(
              //   hint!,
              //   style: TextStyle(fontSize: 20),
              //   overflow: TextOverflow.ellipsis,
              // ),
              items: items,
              onChanged: (item) {
                onChanged!(item);
              },
              isExpanded: true,
              underline: Container(),
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
          ),
        ),
      ],
    );
  }
}
