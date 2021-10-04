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
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          padding: EdgeInsets.only(left: 20),
          child: List_Hashtag(selectIndex),
        ),
      ],
    );
  }

  Widget List_Hashtag(int selectItem) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.category.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            selectIndex = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.height * 0.15,
            ),
            // width: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: selectItem == index ? Color(0xffc2b5a5) : Colors.white,
              border: Border.all(
                color: Color(0xffc2b5a5),
              ),
            ),
            child: Center(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.category[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'NotoSansJP-Medium.otf',
                    ),
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
