import 'package:flutter/material.dart';

class Statusviews extends StatefulWidget {
  const Statusviews({super.key});

  @override
  State<Statusviews> createState() => _StatusviewsState();
}

class _StatusviewsState extends State<Statusviews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(color: Colors.blueAccent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/ph.png', height: 30, width: 30),
                    const SizedBox(width: 5),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '5.5%',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Text('PH LEVEL', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                decoration: const BoxDecoration(color: Colors.blueAccent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/ppm.png', height: 30, width: 30),
                    const SizedBox(width: 5),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '560ppm',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Text('NUTRIENT (NCS)', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(color: Colors.blueAccent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/humidity.png',
                        height: 30, width: 30),
                    const SizedBox(width: 5),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '62%',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Text('HUMIDITY', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(color: Colors.blueAccent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/temperature.png',
                        height: 30, width: 30),
                    const SizedBox(width: 5),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '26°',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        Text('TEMPERATURE', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
