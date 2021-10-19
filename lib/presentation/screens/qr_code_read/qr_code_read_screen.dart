import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parsowa/core/constants/colors.dart';
import 'package:parsowa/core/constants/strings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'clock_In_completed_screen.dart';
import 'clock_out_completed_screen.dart';

class QRCodeReadScreen extends StatefulWidget {
  static const String routeName = "/QRCodeReadScreen";

  const QRCodeReadScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<QRCodeReadScreen> createState() => _QRCodeReadScreenState();
}

class _QRCodeReadScreenState extends State<QRCodeReadScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? QRcontroller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      QRcontroller!.pauseCamera();
    } else if (Platform.isIOS) {
      QRcontroller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(
                  borderColor: AppColors.primaryColor,
                  // borderRadius: 10,
                  // borderLength: 30,
                  borderWidth: 5,
                  cutOutSize: 300,
                ),
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.primaryColor,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 54.4),
                    Text(
                      '枠内にQRコードをかざしてください',
                      style: TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 28.6),
                    SizedBox(
                      width: 140,
                      height: 38,
                      child: _btnOK('戻る', _onClick),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Todo: Navigate to Clock in completed
  void _onQRViewCreated(QRViewController controller) {
    this.QRcontroller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(
        () {
          print(
              'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}');
          if (scanData.code == "clock out") {
            controller.pauseCamera();
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClockOutCompletedScreen()))
                .then((value) => controller.resumeCamera());
          } else if (scanData.code == "clock in") {
            controller.pauseCamera();
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ClockInCompletedScreen()))
                .then((value) => (value) => controller.resumeCamera());
          } else {
            return;
          }
        },
      );
    });
  }

  _onClick() {
    //Navigator.pop(context);
    print('hello');
  }

  @override
  void dispose() {
    QRcontroller!.dispose();
    super.dispose();
  }
}

Widget _btnOK(String text, Function() onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryColor,
        fontFamily: 'NotoSanJP',
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: StadiumBorder(),
      primary: AppColors.whiteColor,
    ),
  );
}
