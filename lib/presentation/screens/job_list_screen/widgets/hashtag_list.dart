import 'package:flutter/material.dart';

class hashtag_list extends StatefulWidget {
  const hashtag_list({Key? key, required this.category}) : super(key: key);

  final List<String> category;

  @override
  State<hashtag_list> createState() => _hashtag_listState();
}

class _hashtag_listState extends State<hashtag_list> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.category.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => listItem(index, context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 100,
          ),
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: selectIndex == index
                ? const Color(0xffc2b5a5)
                : Color(0xffFFFFFF),
            border: Border.all(
              color: const Color(0xffc2b5a5),
            ),
          ),
          child: textHashList(index),
        ),
      ),
    );
  }

  Widget textHashList(int index) {
    return Center(
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.category[index],
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'NotoSanJP',
              fontWeight: FontWeight.bold,
              color: selectIndex == index
                  ? const Color(0xfff4f4f3)
                  : const Color(0xff2c2c2c),
            ),
          ),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
