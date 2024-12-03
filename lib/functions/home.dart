// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:greenhouse_monitoring_project/utility_widgets/buttons.dart';
import 'dart:math' as math;
import 'camera.dart';
import 'bndbox.dart';
import 'models.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const HomePage(this.cameras, {super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _recognitions = [];
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";
// Interpreter for the models

  @override
  void initState() {
    super.initState();
  }

  // Load the model using tflite_flutter
  loadModel() async {
    try {
      String modelPath;
      switch (_model) {
        case yolo:
          modelPath = "assets/models/yolov2_tiny.tflite";
          break;

        case mobilenet:
          modelPath = "assets/models/mobilenet_v1_1.0_224.tflite";
          break;

        case posenet:
          modelPath =
              "assets/models/posenet_mv1_075_float_from_checkpoints.tflite";
          break;

        default:
          modelPath = "assets/models/ssd_mobilenet.tflite";
      }

      // Load the model using tflite_flutter
      print('Model loaded: $modelPath');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  // Callback for selecting the model
  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  // Set the recognitions result
  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: _model == ""
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Buttons(
                    onTap: () {
                      onSelect(ssd);
                    },
                    label: 'ssd',
                    color: Colors.blueAccent,
                    labelColor: Colors.white,
                    Borderradius: 5,
                  ),
                  Buttons(
                    onTap: () {
                      onSelect(yolo);
                    },
                    label: 'yolo',
                    color: Colors.blueAccent,
                    labelColor: Colors.white,
                    Borderradius: 5,
                  ),
                  Buttons(
                    onTap: () {
                      onSelect(mobilenet);
                    },
                    label: 'mobilenet',
                    color: Colors.blueAccent,
                    labelColor: Colors.white,
                    Borderradius: 5,
                  ),
                  Buttons(
                    onTap: () {
                      onSelect(posenet);
                    },
                    label: 'posenet',
                    color: Colors.blueAccent,
                    labelColor: Colors.white,
                    Borderradius: 5,
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                CameraWidget(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                BndBox(
                    _recognitions,
                    math.max(_imageHeight, _imageWidth),
                    math.min(_imageHeight, _imageWidth),
                    screen.height,
                    screen.width,
                    _model),
              ],
            ),
    );
  }
}
