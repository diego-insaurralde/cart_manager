import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraTextRecognition extends StatefulWidget {
  const CameraTextRecognition({super.key});

  @override
  State<CameraTextRecognition> createState() => _CameraTextRecognitionState();
}

class _CameraTextRecognitionState extends State<CameraTextRecognition> {
  List<CameraDescription>? cameras;
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    // Get a list of available cameras.
    // In this example, we will only use the first camera.
    availableCameras().then((cams) {
      cameras = cams;
      controller = CameraController(cameras![0], ResolutionPreset.high);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }

    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }
}
