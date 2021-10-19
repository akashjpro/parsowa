import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

import 'package:camera/camera.dart';
import 'package:parsowa/core/constants/colors.dart';

class DisplayCamera extends StatefulWidget {
  final List<CameraDescription> cameras;
  const DisplayCamera({Key? key, required this.cameras}) : super(key: key);

  @override
  State<DisplayCamera> createState() => _DisplayCameraState();
}

class _DisplayCameraState extends State<DisplayCamera>
    with WidgetsBindingObserver {
  CameraController? _controller;

  late Future<void> _initController;

  var isCameraReady = false;
  late XFile imageFile;

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _controller!.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initController =
          (_controller != null ? _controller?.initialize() : null)!;
    }
    if (!mounted) {
      isCameraReady = true;
    }

    final CameraController? cameraController = _controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  Widget cameraWidget(BuildContext context) {
    var camera = _controller!.value;
    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * camera.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Transform.scale(
        scale: scale, child: Center(child: CameraPreview(_controller!)));
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_controller != null) {
      await _controller!.dispose();
    }

    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    _controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {}

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 4, child: _cameraPreviewWidget()
              // cameraWidget(context),
              ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = _controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Listener(
        child: CameraPreview(
          _controller!,
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
            );
          }),
        ),
      );
    }
  }

  initCamera() {
    _controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    _initController = _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraReady = false;
      });
    });
  }
}
