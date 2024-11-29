import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Function()? onTap;
  final String label;
  final Color color;
  final Color labelColor;

  const Buttons({
    super.key,
    required this.onTap,
    required this.label,
    required this.color,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Bounce(
          onTap: onTap,
          tapDelay: Duration(milliseconds: 150),
          longPressDuration: Duration(microseconds: 0),
          child: Container(
            width: MediaQuery.of(context).size.width - 80,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    color: labelColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.8),
              ),
            ),
          )),
    );
  }
}
