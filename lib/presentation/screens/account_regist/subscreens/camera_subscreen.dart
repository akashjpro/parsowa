import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:parsowa/core/constants/colors.dart';

class DisplayCamera extends StatefulWidget {
  const DisplayCamera({Key? key, required}) : super(key: key);

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
      _initController =
          (_controller != null ? _controller.initialize() : null)!;
    }
    if (!mounted) {
      isCameraReady = true;
    }
  }

  Widget cameraWidget(context) {
    var camera = _controller.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
        scale: scale, child: Center(child: CameraPreview(_controller)));
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
              Expanded(
                flex: 4,
                child: cameraWidget(context),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  color: AppColors.primaryColor,
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
}
