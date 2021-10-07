import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/presentation/widgets/app_bar_custom.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        isActionHide: false,
        isLeadingHide: true,
        stringTitle: '申し込み',
        onBackPress: () {},
        onClosePress: () {},
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildHeader(),
                _buildContent(),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 92.0),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          '申し込みする',
          style: TextStyle(
            fontFamily: 'NotoSanJP',
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.whiteColor;
            }
            return AppColors.primaryColor;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.primaryColor;
            }
            return AppColors.whiteColor;
          }),
          shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
            if (states.contains(MaterialState.pressed)) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                  side: const BorderSide(color: AppColors.primaryColor));
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F6F4),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              '申し込み後の流れ',
              style: TextStyle(
                fontFamily: 'NotoSanJP',
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
            color: AppColors.whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ..._buildStep1(),
                ..._buildStep2(),
                ..._buildStep3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStep1() {
    return <Widget>[
      _buildStepHeader('01'),
      _buildBadge('事業所から連絡'),
      _buildContentInsideStep('ご登録のメールアドレスまたは電話番号へ、事業所から連絡いたします。'),
      _buildContentInsideStep('※メールアドレスの迷惑メール設定等にご注意ください。')
    ];
  }

  List<Widget> _buildStep2() {
    return <Widget>[
      _buildStepHeader('02'),
      _buildBadge('面接日決定'),
      _buildContentInsideStep('事業所と相談の上、面接日を決定してください。'),
    ];
  }

  List<Widget> _buildStep3() {
    return <Widget>[
      _buildStepHeader('03'),
      _buildBadge('面接'),
      _buildContentInsideStep('面接日に事業所の方と面接を行っていただきます。'),
    ];
  }

  Widget _buildBadge(String content) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          content,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 19.0,
            fontFamily: 'NotoSanJP',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildStepHeader(String stepNumber) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'STEP',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontFamily: 'OpenSans',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            stepNumber,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontFamily: 'OpenSans',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 26.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'この業務に申し込みます。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
          Text(
            '申し込み後の流れをご確認ください。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NotoSanJP',
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentInsideStep(String content) {
    return Text(
      content,
      style: const TextStyle(
        fontFamily: 'NotoSanJP',
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      ),
    );
  }
}
