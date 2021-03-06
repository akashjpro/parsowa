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

class _QRCodeReadScreenState extends State<QRCodeReadScreen>
    with WidgetsBindingObserver {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? QRcontroller;

  bool isBackButtonActivated = false;

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
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    QRcontroller!.dispose();
    super.dispose();
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
                      '?????????QR????????????????????????????????????',
                      style: TextStyle(
                          fontFamily: 'NotoSanJP',
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 28.6),
                    SizedBox(
                      width: 140,
                      height: 38,
                      child: _btnOK('??????', _onClick),
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
    setState(() {
      controller.scannedDataStream.listen((scanData) {
        result = scanData;
        print(
            'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}');
        if (result!.code == "clock out") {
          controller.pauseCamera();
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClockOutCompletedScreen()))
              .then((value) => controller.resumeCamera());
        } else if (result!.code == "clock in") {
          controller.pauseCamera();
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ClockInCompletedScreen()))
              .then((value) => controller.resumeCamera());
        } else {
          controller.pauseCamera();
          _showDialog(context).then((value) => controller.resumeCamera());
        }
      });
    });
  }

  _onClick() {
    Navigator.pop(context);
  }
}

Future<String?> _showDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('??????????????????????????????'),
      content: const Text('???????????????????????????????????????????????????'),
      actions: <Widget>[
        TextButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: const Text(
            'OK',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: "NotoSanJP",
            ),
          ),
        ),
      ],
    ),
  );
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
