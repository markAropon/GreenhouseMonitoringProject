import 'package:flutter/material.dart';
import 'package:greenhouse_monitoring_project/pages/app_login.dart';
import 'package:greenhouse_monitoring_project/pages/signUp.dart';

class Landingpage extends StatefulWidget {
  const Landingpage({super.key});

  @override
  State<Landingpage> createState() => _LandingpageState();
}

class _LandingpageState extends State<Landingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 220, 224, 230), // Light Steel Blue
              Color.fromARGB(255, 97, 174, 236), // Steel Blue
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 280,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/Group127.png',
                                    fit: BoxFit.contain,
                                    width: 50, // Adjust the size here
                                    height:
                                        50, // Optional: Adjust height if needed
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'GREEMO',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 0, 151, 8),
                                      fontSize: 50,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Agriculture Green Monitoring',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 50,
              bottom: 40,
              child: TextButton(
                onPressed: () {
                  goToLogin(context);
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 50,
              bottom: 40,
              child: TextButton(
                onPressed: () {
                  goToSignUp(context);
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToSignUp(BuildContext context) {
    Navigator.push(
      context,
      _createSheetTransition(const Signup(),
          fromBottom: true), // transition from bottom for SignUp
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      _createSheetTransition(const LoginScreen(),
          fromBottom: false), // transition from top for Login
    );
  }

  // Custom "sheet" transition route builder
  PageRouteBuilder _createSheetTransition(Widget page,
      {required bool fromBottom}) {
    final begin = fromBottom
        ? const Offset(0.0, 1.0)
        : const Offset(
            0.0, -1.0); // For bottom-to-top or top-to-bottom transition
    const end = Offset.zero; // Final position (original position)
    const curve = Curves.easeInOut; // Animation curve

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
