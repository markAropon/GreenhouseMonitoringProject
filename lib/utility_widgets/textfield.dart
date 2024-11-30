import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final TextEditingController Controller;
  final bool obscureText;
  final String hintText;
  final String label;
  final bool isPasswordField;

  const Textfield({
    super.key,
    required this.Controller,
    required this.obscureText,
    required this.hintText,
    required this.label,
    required this.isPasswordField,
  });

  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void clear() {
    widget.Controller.clear();
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle visibility state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
<<<<<<< HEAD
      padding: const EdgeInsets.symmetric(horizontal: 20),
=======
      padding: EdgeInsets.symmetric(horizontal: 20),
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
      child: Stack(
        children: [
          TextField(
            controller: widget.Controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffix: widget.isPasswordField
                  ? GestureDetector(
                      onTap:
                          togglePasswordVisibility, // Show/hide password when tapped
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : GestureDetector(
                      onTap: clear,
                      child: const Icon(Icons.clear),
                    ),
              fillColor: Colors.white, // Set background color to white
              filled: true, // Ensure the background color is filled
<<<<<<< HEAD
              hintStyle:
                  const TextStyle(color: Colors.grey), // Style for hint text
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

              contentPadding: const EdgeInsets.symmetric(
=======
              hintStyle: TextStyle(color: Colors.grey), // Style for hint text
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

              contentPadding: EdgeInsets.symmetric(
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
                vertical: 20.0,
                horizontal: 15.0, // Padding inside the Textbox
              ),
            ),
          ),
          Positioned(
            top: 5.0,
            left: 3.0,
            child: Container(
<<<<<<< HEAD
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              color: Colors.white,
              child: Text(
                widget.label,
                style: const TextStyle(
=======
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              color: Colors.white,
              child: Text(
                widget.label,
                style: TextStyle(
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
