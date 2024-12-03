import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:math' as math;

import 'models.dart';

typedef Callback = void Function(List<dynamic> list, int h, int w);

class CameraWidget extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Callback setRecognitions;
  final String model;

  const CameraWidget(this.cameras, this.model, this.setRecognitions,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<CameraWidget> {
  late CameraController controller;
  bool isDetecting = false;
  late Interpreter _interpreter;

  @override
  void initState() {
    super.initState();
    loadModel(); // Load the model when the widget is initialized.

    if (widget.cameras.isEmpty) {
      print('No camera is found');
    } else {
      controller = CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
      );
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});

        controller.startImageStream((CameraImage img) {
          if (!isDetecting) {
            isDetecting = true;

            int startTime = DateTime.now().millisecondsSinceEpoch;

            if (widget.model == mobilenet) {
              _runModelOnFrame(img);
            } else if (widget.model == posenet) {
              _runPoseNetOnFrame(img);
            } else {
              _runObjectDetectionOnFrame(img);
            }

            int endTime = DateTime.now().millisecondsSinceEpoch;
            print("Detection took ${endTime - startTime} ms");
          }
        });
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _interpreter.close(); // Don't forget to close the interpreter when done.
    super.dispose();
  }

  // Loading the appropriate model with tflite_flutter
  loadModel() async {
    try {
      String modelPath;
      if (widget.model == mobilenet) {
        modelPath = "assets/models/mobilenet_v1_1.0_224.tflite";
      } else if (widget.model == posenet) {
        modelPath =
            "assets/models/posenet_mv1_075_float_from_checkpoints.tflite";
      } else {
        modelPath = "assets/models/ssd_mobilenet.tflite";
      }

      _interpreter = await Interpreter.fromAsset(modelPath);
      print("Model loaded successfully.");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  // Object Detection method using tflite_flutter
  _runObjectDetectionOnFrame(CameraImage img) async {
    if (_interpreter == null) {
      print("Interpreter is not initialized yet.");
      return;
    }

    var inputImage = img.planes.map((plane) {
      return plane.bytes;
    }).toList();

    var input = inputImage.first; // Placeholder for the image input.
    var output = List.filled(1, 0);

    // Perform inference here. Update with correct model's input/output shapes.
    _interpreter.run(input, output);

    widget.setRecognitions(output, img.height, img.width);
    isDetecting = false;
  }

  // PoseNet method using tflite_flutter
  _runPoseNetOnFrame(CameraImage img) async {
    if (_interpreter == null) {
      print("Interpreter is not initialized yet.");
      return;
    }

    var inputImage = img.planes.map((plane) {
      return plane.bytes;
    }).toList();

    var input = inputImage.first;
    var output = List.filled(1, 0);

    // Perform inference here for PoseNet.
    _interpreter.run(input, output);

    widget.setRecognitions(output, img.height, img.width);
    isDetecting = false;
  }

  // MobileNet method using tflite_flutter
  _runModelOnFrame(CameraImage img) async {
    if (_interpreter == null) {
      print("Interpreter is not initialized yet.");
      return;
    }

    var inputImage = img.planes.map((plane) {
      return plane.bytes;
    }).toList();

    var input = inputImage.first; // Placeholder for the image input.
    var output = List.filled(1, 0);

    // Perform inference with the model here.
    _interpreter.run(input, output);

    widget.setRecognitions(output, img.height, img.width);
    isDetecting = false;
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    var tmp = MediaQuery.of(context).size;
    var screenH = math.max(tmp.height, tmp.width);
    var screenW = math.min(tmp.height, tmp.width);
    tmp = controller.value.previewSize!;
    var previewH = math.max(tmp.height, tmp.width);
    var previewW = math.min(tmp.height, tmp.width);
    var screenRatio = screenH / screenW;
    var previewRatio = previewH / previewW;

    return OverflowBox(
      maxHeight:
          screenRatio > previewRatio ? screenH : screenW / previewW * previewH,
      maxWidth:
          screenRatio > previewRatio ? screenH / previewH * previewW : screenW,
      child: CameraPreview(controller),
    );
  }
}
