import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomOfAppbar extends StatefulWidget {
  const BottomOfAppbar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomOfAppbar> createState() => _bottom_of_appbarState();
}

class _bottom_of_appbarState extends State<BottomOfAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 36,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xfff4f1f1),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 5),
                    child: iconSearch(),
                  ),
                  Container(
                    height: 36,
                    child: TextField(
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        contentPadding: EdgeInsets.only(left: 45),
                        hintText: '曜日、時間などで探す',
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Color(0xff7C7C7C),
                          fontFamily: 'NotoSanJP',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  )
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
      //textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: '曜日、時間などで探す',
        hintStyle: TextStyle(
          fontSize: 18,
          color: Color(0xff7C7C7C),
          fontFamily: 'NotoSanJP',
          fontWeight: FontWeight.normal,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
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
        elevation: MaterialStateProperty.all(0.0),
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
