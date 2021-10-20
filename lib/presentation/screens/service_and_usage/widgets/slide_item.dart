import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/screens/login/login_screen.dart';
import 'package:parsowa/presentation/screens/my_page/my_page_screen.dart';
import 'package:parsowa/presentation/screens/service_and_usage/model/slide.dart';
import 'package:parsowa/presentation/screens/web_view/web_view.dart';

class SlideItem extends StatelessWidget {
  final int index;

  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 375,
              height: 450,
              decoration: BoxDecoration(
                color: Color(0xFFE9E9E9),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(slideList[index].imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 26.4,
            ),
            Text(
              slideList[index].title,
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontSize: 22,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  slideList[index].description,
                  style: TextStyle(
                    fontFamily: 'NotoSanJP',
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "利用規約",
                  style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 39.9,
                ),
                Text(
                  "プライバシーポリシー",
                  style: TextStyle(
                      fontFamily: 'NotoSanJP',
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            _buildButton(slideList[index].textButton, AppColors.primaryColor,
                AppColors.whiteColor, AppColors.primaryColor, () {
              switch (index) {
                case 0:
                  Navigator.of(context).pushNamed(
                    WebViewScreen.routeName,
                    arguments: Strings.termsOfUseTitle,
                  );
                  break;
                case 1:
                  Navigator.of(context).pushNamed(
                    WebViewScreen.routeName,
                    arguments: Strings.termsOfUseTitle,
                  );
                  break;
                case 2:
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                  break;
                case 3:
                  Navigator.of(context)
                      .pushReplacementNamed(MyPageScreen.routeName);
                  break;
              }
            }),
          ],
        ));
  }

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
        minWidth: 180,
        elevation: 0,
        color: bg,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19.0),
            side: BorderSide(color: borderColor, width: 2)),
      );
}
