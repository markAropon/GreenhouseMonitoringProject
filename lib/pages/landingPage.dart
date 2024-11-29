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
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/file1 1.png',
              fit: BoxFit.fill,
            ),
          ),
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
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Group127.png',
                                  fit: BoxFit.contain,
                                  width: 20,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  'GREEMO',
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
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
            left: 40,
            bottom: 20,
            child: TextButton(
              onPressed: () {
                goToLogin(context);
              },
              child: Text(
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
            right: 40,
            bottom: 20,
            child: TextButton(
              onPressed: () {
                goToSignUp(context);
              },
              child: Text(
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
    );
  }

  void goToSignUp(BuildContext context) {
    Navigator.push(
      context,
      _createSheetTransition(Signup(),
          fromBottom: true), // transition from bottom for SignUp
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
      _createSheetTransition(LoginScreen(),
          fromBottom: false), // transition from top for Login
    );
  }

  // Custom "sheet" transition route builder
  PageRouteBuilder _createSheetTransition(Widget page,
      {required bool fromBottom}) {
    final begin = fromBottom
        ? Offset(0.0, 1.0)
        : Offset(0.0, -1.0); // For bottom-to-top or top-to-bottom transition
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
