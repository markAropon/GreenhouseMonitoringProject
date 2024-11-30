// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:greenhouse_monitoring_project/pages/dashboard.dart';

import '../utility_widgets/buttons.dart';
import '../utility_widgets/textfield.dart';

void main() {
  runApp(const LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final pass = TextEditingController();
  bool _isLoading = false;

  // Button
  void signinUser(BuildContext context) async {
    if (username.text.isEmpty || pass.text.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.topSlide,
        title: 'Missing Credentials',
        desc: 'Please enter both email and password.',
        btnOkOnPress: () {},
      ).show();
      return;
    }

    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username.text,
        password: pass.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } on FirebaseAuthException catch (errorMessage) {
      String message;

      switch (errorMessage.code) {
        case 'invalid-credential':
          message =
              'The Credentials Given Does Not Match Anything In the Database.';
          break;
        case 'invalid-email':
          message = 'The email address is not valid.';
          break;
        case 'too-many-requests':
          message = 'Too many requests. Please try again later.';
          break;
        default:
          message =
              'An unknown error occurred. Please try again.  ${errorMessage.code.toString()}';
      }

      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        title: 'Login Failed',
        desc: message,
        btnOkOnPress: () {},
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        title: 'Error',
        desc: 'An unexpected error occurred: ${e.toString()}',
        btnOkOnPress: () {},
      ).show();
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 195, 230, 155),
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 195, 224, 163)),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset('assets/icons/leafIcon.png')),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 520,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(19, 62, 135, 1),
                  border: Border.symmetric(
                      vertical: BorderSide(color: Colors.blue, width: 1),
                      horizontal: BorderSide(color: Colors.blue, width: 1)),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  wordSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Textfield(
                        Controller: username,
                        obscureText: false,
                        hintText: 'Juandelacruz@gmail.com',
                        label: 'Username',
                        isPasswordField: false,
                      ),
                      const SizedBox(height: 10),
                      Textfield(
                        Controller: pass,
                        obscureText: true,
                        hintText: '********',
                        label: 'Password',
                        isPasswordField: true,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: forgotpass,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Buttons(
                        onTap: () => signinUser(context),
                        color: const Color.fromARGB(255, 13, 183, 101),
                        label: 'Login',
                        labelColor: Colors.white,
                      ),
                      if (_isLoading) const CircularProgressIndicator(),
                      /*                    const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: googleLogin,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Lottie.asset(
                            'assets/farmer.json',
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

googleLogin() {}

forgotpass() {}
