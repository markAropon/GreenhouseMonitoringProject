import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class Tracker extends StatefulWidget {
  const Tracker({super.key});

  @override
  State<Tracker> createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  bool isWorking = false;
  String result = "";
  CameraController? camControl;
  CameraImage? image;
  bool isCamInitialized = false;

  late Interpreter interpreter;
  List<String> labels = [];

  // Load the model
  loadModel() async {
    try {
      final options = InterpreterOptions();
      interpreter = await Interpreter.fromAsset(
        'assets/models/mobilenet_v1_1.0_224.tflite',
        options: options,
      );
      print("Model Loaded");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  // Load labels from the asset file
  loadLabels() async {
    try {
      final labelsData =
          await rootBundle.loadString('assets/models/mobilenet_v1_1.0_224.txt');
      labels = labelsData.split('\n');
      print("Labels Loaded");
    } catch (e) {
      print("Error loading labels: $e");
    }
  }

  // Initialize camera
  initializeCam() async {
    camControl = CameraController(camera[0], ResolutionPreset.medium);
    try {
      await camControl?.initialize().then((value) {
        if (!mounted) return;
        setState(() {
          isCamInitialized = true;
        });
        camControl?.startImageStream((imageFromStream) {
          if (!isWorking) {
            isWorking = true;
            image = imageFromStream;
            runModelOnStream();
          }
        });
      });
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  // Preprocess the camera image and prepare the tensor for the model
  Float32List preprocessImage(CameraImage imageFromStream) {
    try {
      var planes = imageFromStream.planes;
      var bytesList = <int>[];
      for (var plane in planes) {
        bytesList.addAll(plane.bytes);
      }

      img.Image originalImage = img.Image.fromBytes(
        imageFromStream.width,
        imageFromStream.height,
        Uint8List.fromList(bytesList),
        format: img.Format.rgb,
      );

      img.Image resizedImage =
          img.copyResize(originalImage, width: 224, height: 224);

      // Ensure that the input tensor size is correct
      int tensorSize = 224 * 224 * 3;
      Float32List inputTensor = Float32List(tensorSize);

      int index = 0;
      for (var y = 0; y < 224; y++) {
        for (var x = 0; x < 224; x++) {
          var pixel = resizedImage.getPixel(x, y);

          int red = img.getRed(pixel);
          int green = img.getGreen(pixel);
          int blue = img.getBlue(pixel);

          // Debugging: Check the index value to avoid range errors
          if (index >= tensorSize) {
            print("Index exceeded tensor size: $index >= $tensorSize");
            throw RangeError("Index out of range during image processing.");
          }

          inputTensor[index++] = (red / 127.5) - 1.0;
          inputTensor[index++] = (green / 127.5) - 1.0;
          inputTensor[index++] = (blue / 127.5) - 1.0;
        }
      }

      return inputTensor;
    } catch (e) {
      print("Error during image preprocessing: $e");
      rethrow; // Re-throw the error so it can be caught in the main logic
    }
  }

  // Run the model on the stream frame
  runModelOnStream() async {
    if (image != null) {
      try {
        Float32List inputTensor = preprocessImage(image!);
        List<Float32List> output = List.filled(1, Float32List(1001));

        print("Running inference...");
        interpreter.run([inputTensor], [output]);

        double maxValue = double.negativeInfinity;
        int maxIndex = -1;
        for (int i = 0; i < output[0].length; i++) {
          double value = output[0][i];
          if (value > maxValue) {
            maxValue = value;
            maxIndex = i;
          }
        }

        String predictedLabel = labels[maxIndex];

        setState(() {
          result = "Predicted: $predictedLabel (Confidence: $maxValue)";
        });

        isWorking = false;
      } catch (e) {
        print("Error during inference: $e");
        setState(() {
          result = "Error: $e";
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadModel();
    loadLabels();
    initializeCam();
  }

  @override
  void dispose() async {
    super.dispose();
    interpreter.close();
    camControl?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(
      //title: Text(''),
      //backgroundColor: Colors.blueAccent[100],
      //),
      body: Stack(
        children: [
          isCamInitialized
              ? Positioned.fill(
                  child: CameraPreview(camControl!),
                )
              : const Center(child: CircularProgressIndicator()),

          // Result overlay on top of the camera preview
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.7),
              child: Text(
                result.isEmpty ? '??' : result,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
