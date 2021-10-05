import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottom_of_appbar extends StatelessWidget {
  const bottom_of_appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          height: 51,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xffF2F3F2),
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, right: 8),
                child: icon_search(),
              ),
              text_search()
            ],
          ),
        ),
        Container(
          child: button_search(),
        )
      ],
    );
  }

  Widget icon_search() {
    return SvgPicture.asset(
      'assets/icons/icon_svg/Search_icon_on.svg',
      color: Color(0xffc2b5a5),
      width: 18,
      height: 18,
    );
  }

  Widget text_search() {
    return const TextField(
      decoration: InputDecoration(
        hintText: '曜日、時間などで探す',
        hintStyle: TextStyle(fontSize: 18, color: Color(0xff7C7C7C)),
        contentPadding: EdgeInsets.only(left: 50),
        border: InputBorder.none,
      ),
    );
  }

  Widget button_search() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('クリア',
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
          )),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.black))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );
  }
}
