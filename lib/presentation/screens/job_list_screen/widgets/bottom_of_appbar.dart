import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class bottom_of_appbar extends StatefulWidget {
  const bottom_of_appbar({
    Key? key,
  }) : super(key: key);

  @override
  State<bottom_of_appbar> createState() => _bottom_of_appbarState();
}

class _bottom_of_appbarState extends State<bottom_of_appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 36,
              // width: 280,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffe9e9e9),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 8),
                    child: iconSearch(),
                  ),
                  textSearch()
                ],
              ),
            ),
          ),
          SizedBox(width: 17),
          Container(
            height: 22,
            child: buttonSearch(),
          ),
        ],
      ),
    );
  }

  Widget iconSearch() {
    return SvgPicture.asset(
      'assets/icons/icon_svg/Search_icon_on.svg',
      color: Color(0xff929191),
      width: 18,
      height: 18,
    );
  }

  Widget textSearch() {
    return const TextField(
      decoration: InputDecoration(
        hintText: '曜日、時間などで探す',
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color(0xff7C7C7C),
          fontFamily: 'NotoSanJP',
          fontWeight: FontWeight.normal,
        ),
        contentPadding: EdgeInsets.only(left: 50, bottom: 12),
        border: InputBorder.none,
      ),
    );
  }

  Widget buttonSearch() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        'クリア',
        style: TextStyle(
          color: Color(0xff7C7C7C),
          fontSize: 10,
          fontFamily: 'NotoSanJP',
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: Color(0xff929191)),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffFFFFFF)),
      ),
    );
  }
}
