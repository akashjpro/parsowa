import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:parsowa/presentation/screens/service_and_usage/model/slide.dart';
import 'package:parsowa/presentation/screens/service_and_usage/widgets/slide_dots.dart';
import 'package:parsowa/presentation/screens/service_and_usage/widgets/slide_item.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class ServiceAndUsageScreen extends StatefulWidget {
  static const String routeName = "/ServiceAndUsageScreen";

  @override
  ServiceAndUsageScreenState createState() => ServiceAndUsageScreenState();
}

class ServiceAndUsageScreenState extends State<ServiceAndUsageScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      // _pageController.animateToPage(
      //   _currentPage,
      //   duration: Duration(milliseconds: 300),
      //   curve: Curves.easeIn,
      // );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
          stringTitle: Strings.serviceAndUsageTitle,
          isLeadingHide: true,
          isActionHide: false,
          onBackPress: () => {},
          onClosePress: () => {Navigator.of(context).pop()}),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 58),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
