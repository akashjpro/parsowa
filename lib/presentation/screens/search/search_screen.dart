import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/job_list/data/job_list_data.dart';
import 'package:parsowa/presentation/screens/job_list/data/prefecture_list.dart';
import 'package:parsowa/presentation/screens/search/apply_fillter_screen.dart';
import 'package:parsowa/presentation/screens/search/widgets/hashtag_list.dart';
import 'package:parsowa/presentation/screens/search/widgets/job_list_widget.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';
import 'package:parsowa/presentation/widgets/bottom_nav_bar_widget.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/SearchScreen";

  SearchScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final data = JobData.initData();
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _focusNode = FocusNode();
  List<String> category = [
    '午前中',
    '午後',
    '身体',
    '身体・生活',
    '身体・生活 身体・生活 身体・生活',
  ];
  ExpandableController expandableCheck = ExpandableController();
  String? initDropdown = '';
  bool isHide = true;
  late TextEditingController searchController;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    expandableCheck.dispose();
    isHide = true;
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: widget.title,
          isLeadingHide: true,
          isActionHide: true,
          onBackPress: () => {},
          onClosePress: () => {}),
      body: _buildBottomAppbar(context),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }

  _buildBottomAppbar(BuildContext context) => ExpandableNotifier(
        controller: expandableCheck,
        child: Column(
          children: [
            ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false,
                ),
                header: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Color(0xffC9C9C9), width: 1))),
                  child: GestureDetector(
                    onTap: () {
                      expandableCheck.value = !expandableCheck.value;
                      print(expandableCheck.value);
                      FocusScope.of(context).unfocus();
                      searchController.clear();
                      setState(() {
                        isHide = !isHide;
                      });
                    },
                    child: Row(
                      children: [
                        Flexible(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 60,
                            child: TextField(
                              enabled: false,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.unselectedColor,
                                  fontFamily: 'NotoSanJP',
                                  fontWeight: FontWeight.w700),
                              decoration: InputDecoration(
                                  prefixIconConstraints: const BoxConstraints(
                                      maxHeight: 18, maxWidth: 48),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 20),
                                    child: SvgPicture.asset(
                                      'assets/icons/icon_svg/Search_icon_on.svg',
                                      color: const Color(0xff929191),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  suffixIconConstraints: const BoxConstraints(
                                      maxHeight: 16, maxWidth: 46),
                                  suffixIcon: isHide
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: SvgPicture.asset(
                                            'assets/icons/icon_svg/down_btn.svg',
                                            fit: BoxFit.contain,
                                            width: 16,
                                            height: 16,
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: SvgPicture.asset(
                                            'assets/icons/icon_svg/up_btn.svg',
                                            width: 16,
                                            height: 16,
                                          ),
                                        ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: '絞り込み',
                                  hintStyle: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff7C7C7C),
                                      fontFamily: 'NotoSanJP',
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [expandedSection(context)],
                ),
                collapsed: Container()),
            Flexible(
              child: Stack(children: [
                JobListBodyWidget(
                  data: widget.data,
                ),
                if (!isHide || expandableCheck.value)
                  Container(
                    color: AppColors.unselectedColor.withOpacity(0.5),
                    child: GestureDetector(
                      onTap: () {
                        expandableCheck.value = !expandableCheck.value;
                        FocusScope.of(context).unfocus();
                        searchController.clear();
                        setState(() {
                          isHide = !isHide;
                        });
                      },
                    ),
                  )
              ]),
            ),
          ],
        ),
      );

  Widget _buildSmallButton(String title, Color bg, Color textColor,
          Color borderColor, Function onPress) =>
      MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () => onPress(),
        child: Text(
          title,
          style: TextStyle(
            height: 1,
            fontFamily: 'NotoSanJP',
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        height: 22,
        minWidth: 68,
        elevation: 0,
        color: bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: borderColor)),
      );

  _buildDropDown() => Container(
        width: 182,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xffB2AEAA), width: 1),
        ),
        child: DropdownButton<String>(
          menuMaxHeight: 300,
          isExpanded: true,
          underline: Container(),
          items: prefecture_list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.unselectedColor,
                      fontFamily: 'NotoSanJP',
                      fontWeight: FontWeight.w400)),
            );
          }).toList(),
          hint: const Text(
            '都道府県',
            style: TextStyle(
                fontSize: 16,
                color: Color(0xffc9c6c3),
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w500),
          ),
          onChanged: (_) {},
        ),
      );

  _buildInput(BuildContext context) => SizedBox(
        height: 40,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          focusNode: _focusNode,
          autofocus: false,
          controller: searchController,
          style: const TextStyle(
              fontFamily: 'NotoSanJP',
              fontSize: 16.0,
              color: AppColors.unselectedColor,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            hintText: '○○市　○○区',
            hintStyle: const TextStyle(
                fontSize: 16,
                color: Color(0xffc9c6c3),
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w500),
            filled: false,
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.borderColor, width: 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      );
  Widget _buildButton(String title, Color bg, Color textColor,
          Color borderColor, Function onPress) =>
      MaterialButton(
        onPressed: () => onPress(),
        child: Text(
          title,
          style: TextStyle(
            height: 1,
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        height: 38,
        minWidth: 220,
        elevation: 0,
        color: bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
            side: BorderSide(color: borderColor)),
      );
  expandedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 1, child: _buildDropDown()),
              _buildSmallButton('すべてクリア', AppColors.whiteColor,
                  const Color(0xff929191), const Color(0xff929191), () {})
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            '市・区など（スペースで区切って入力',
            style: TextStyle(
                fontSize: 16,
                color: AppColors.unselectedColor,
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            '※個人情報保護の観点から、番地以下で検索はできません',
            style: TextStyle(
                fontSize: 12,
                color: AppColors.unselectedColor,
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildInput(context),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
          color: const Color(0xffF8F6F4),
          child: HashTagList(category: category),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: _buildButton('この条件で絞り込む', AppColors.primaryColor,
              AppColors.whiteColor, AppColors.whiteColor, () {
            expandableCheck.value = !expandableCheck.value;
            print(expandableCheck.value);
            FocusScope.of(context).unfocus();
            searchController.clear();
            setState(() {
              isHide = !isHide;
            });
          }),
        )
      ],
    );
  }
}
