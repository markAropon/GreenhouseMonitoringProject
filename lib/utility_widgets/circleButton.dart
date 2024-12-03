import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animated Circle Button'),
        ),
        body: const Center(
          child: CircleButton(),
        ),
      ),
    );
  }
}

class CircleButton extends StatefulWidget {
  const CircleButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  bool _isSmallButtonVisible = false;
  void _toggleSmallButton() {
    setState(() {
      _isSmallButtonVisible = !_isSmallButtonVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSmallButton,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.greenAccent,
                width: 1,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(500),
                topRight: Radius.circular(500),
                bottomLeft: Radius.circular(500),
                bottomRight: Radius.circular(500),
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 50.0,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _isSmallButtonVisible ? -50 : 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _isSmallButtonVisible ? 1.0 : 0.0, // Fade-in effect
              child: AnimatedScale(
                duration: const Duration(milliseconds: 300),
                scale: _isSmallButtonVisible ? 1.0 : 0.1,
                child: Container(
                  width: 50.0, // Diameter of smaller circle
                  height: 50.0, // Diameter of smaller circle
                  decoration: BoxDecoration(
                    color: Colors.blue, // Background color of small button
                    shape: BoxShape.circle, // Circular shape
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 1,
                    ),
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
