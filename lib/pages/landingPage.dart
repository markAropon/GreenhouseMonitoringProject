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
<<<<<<< HEAD
              'assets/bgImages/file1 1.png',
=======
              'assets/file1 1.png',
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
<<<<<<< HEAD
                                  'assets/icons/Group127.png',
=======
                                  'assets/Group127.png',
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
<<<<<<< HEAD
                const Text(
=======
                Text(
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
<<<<<<< HEAD
              child: const Text(
=======
              child: Text(
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
<<<<<<< HEAD
              child: const Text(
=======
              child: Text(
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
<<<<<<< HEAD
      _createSheetTransition(const Signup(),
=======
      _createSheetTransition(Signup(),
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
          fromBottom: true), // transition from bottom for SignUp
    );
  }

  void goToLogin(BuildContext context) {
    Navigator.push(
      context,
<<<<<<< HEAD
      _createSheetTransition(const LoginScreen(),
=======
      _createSheetTransition(LoginScreen(),
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
          fromBottom: false), // transition from top for Login
    );
  }

  // Custom "sheet" transition route builder
  PageRouteBuilder _createSheetTransition(Widget page,
      {required bool fromBottom}) {
    final begin = fromBottom
<<<<<<< HEAD
        ? const Offset(0.0, 1.0)
        : const Offset(
            0.0, -1.0); // For bottom-to-top or top-to-bottom transition
=======
        ? Offset(0.0, 1.0)
        : Offset(0.0, -1.0); // For bottom-to-top or top-to-bottom transition
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
