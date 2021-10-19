import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:parsowa/core/constants/colors.dart';

import 'create_camera_subscreen.dart';

class DisplayCamera extends StatefulWidget {
  const DisplayCamera({Key? key}) : super(key: key);

  @override
  State<DisplayCamera> createState() => _DisplayCameraState();
}

class _DisplayCameraState extends State<DisplayCamera>
    with WidgetsBindingObserver {
  late CameraController _controller;

  late Future<void> _initController;

  var isCameraReady = false;
  late XFile imageFile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initCamera();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance!.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller != null ? _initController = _controller.initialize() : null;
    }
    if (!mounted) {
      isCameraReady = true;
    }
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size * 1;
    var scale = 1 * camera.aspectRatio;
    if (scale < 1) scale = 1 * scale;
    return Transform.scale(scale: scale, child: CameraPreview(_controller));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _initController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: [
              // Container(
              //   width: double.infinity,
              //   color: Color(0xffC4C4C4),
              //   child: Center(
              //     child: cameraWidget(context),
              //   ),
              // ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(),
                  child: SizedBox(
                    child: cameraWidget(context),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Color(0xff000000),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 20),
                        child: _buildText('＊必ず原本全体を撮影してください。', 16, 'NotoSansJP',
                            FontWeight.w500, AppColors.whiteColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10),
                        child: _buildText('＊枠内に、必要な情報が入るように', 16, 'NotoSansJP',
                            FontWeight.w500, AppColors.whiteColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: _buildText('撮影をお願いします。', 16, 'NotoSansJP',
                            FontWeight.w500, AppColors.whiteColor),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            onPressed: () => captureImage(context),
                            icon: SizedBox(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    ));
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initController = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  captureImage(BuildContext context) {
    _controller.takePicture().then((file) {
      setState(() {
        imageFile = file;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UploadImage(
            image: imageFile,
          ),
        ),
      );
    });
  }
}

Widget _buildText(String text, double size, String fontFamily,
    FontWeight fontWeight, Color color) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
