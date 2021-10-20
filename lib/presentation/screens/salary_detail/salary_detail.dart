import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/screens/salary_detail/data/salary_detail_data.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class SalaryDetailScreen extends StatefulWidget {
  static const String routeName = "/SalaryDetailScreen";

  const SalaryDetailScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => SalaryDetailScreenState();
}

class SalaryDetailScreenState extends State<SalaryDetailScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBarCustom(
            stringTitle: widget.title,
            isActionHide: true,
            isLeadingHide: false,
            onBackPress: () => Navigator.of(context).pop(),
            onClosePress: () {},
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              children: [
                _buildCard(context, '2', '4,500'),
                const SizedBox(
                  height: 20,
                ),
                _buildTitle('詳細'),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: _buildDetailSalary(SalaryDetail.initData()),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildCard(BuildContext context, String month, String salary) => Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.primaryColor, width: 2)),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$month月暫定合計金額',
                  style: const TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 18.0,
                      color: AppColors.unselectedColor,
                      fontWeight: FontWeight.w700),
                ),
                RichText(
                  text: TextSpan(
                    text: salary,
                    style: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 60.0,
                        color: AppColors.unselectedColor,
                        fontWeight: FontWeight.w700),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' 円',
                        style: TextStyle(
                            fontFamily: 'NotoSanJP',
                            fontSize: 30.0,
                            color: AppColors.unselectedColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const Text(
                  '金額の振り込み日は、各事業所に確認をお願い致します。',
                  style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 12.0,
                      color: AppColors.unselectedColor,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Positioned(
              right: 40,
              top: 15,
              child: Image.asset(
                'assets/logo/logo.png',
                width: 40,
                height: 36.59,
                fit: BoxFit.cover,
              ))
        ],
      );
  Widget _buildTitle(String title) => Container(
        color: const Color(0xfff8f6f4),
        height: 32.0,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          title,
          style: const TextStyle(
              height: 1,
              fontFamily: 'NotoSanJP',
              fontSize: 18.0,
              color: AppColors.unselectedColor,
              fontWeight: FontWeight.w700),
        ),
      );
  _buildDetailSalary(List<SalaryDetail> listData) {
    return listData
        .map((detail) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              height: 40,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: AppColors.lineStandardColor))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(detail.provider,
                      style: const TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 16.0,
                          color: AppColors.unselectedColor,
                          fontWeight: FontWeight.w400)),
                  Text('${detail.price}円',
                      style: const TextStyle(
                          height: 1,
                          fontFamily: 'NotoSanJP',
                          fontSize: 16.0,
                          color: AppColors.unselectedColor,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ))
        .toList();
  }
}
