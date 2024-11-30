// ignore_for_file: unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======

>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
import '../utility_widgets/buttons.dart';
import '../utility_widgets/textfield.dart';
import 'app_login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUpUser() async {
    final String user = username.text.trim();
    final String emailAddress = email.text.trim();
    final String phone = phoneNumber.text.trim();
    final String pass = password.text.trim();
    final String confirmPass = confirmpassword.text.trim();

    if (user.isEmpty ||
        emailAddress.isEmpty ||
        phone.isEmpty ||
        pass.isEmpty ||
        confirmPass.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'Invalid Input',
        desc: 'All fields are required.',
        btnOkOnPress: () {},
      ).show();
      return;
    }

    if (pass != confirmPass) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        title: 'Password Mismatch',
        desc: 'Passwords do not match.',
        btnOkOnPress: () {},
      ).show();
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: pass,
      );
      AwesomeDialog(
        // ignore: use_build_context_synchronously
        context: context,
        dialogType: DialogType.success,
        title: 'Sign Up Successful',
        desc: 'User created successfully.',
        btnOkOnPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
      ).show();
    } catch (e) {
      AwesomeDialog(
        // ignore: use_build_context_synchronously
        context: context,
        dialogType: DialogType.error,
        title: 'Sign Up Failed',
        desc: e.toString(),
        btnOkOnPress: () {},
      ).show();
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
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(19, 62, 135, 1),
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.blue, width: 1),
                    horizontal: BorderSide(color: Colors.blue, width: 1)),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
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
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                wordSpacing: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Textfield(
                      Controller: username,
                      obscureText: false,
                      hintText: '',
                      label: 'Username',
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 10),
                    Textfield(
                      Controller: email,
                      obscureText: false,
                      hintText: '',
                      label: 'Email',
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 10),
                    Textfield(
                      Controller: phoneNumber,
                      obscureText: false,
                      hintText: '',
                      label: 'Phone Number',
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 10),
                    Textfield(
                      Controller: password,
                      obscureText: true,
                      hintText: '',
                      label: 'Password',
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 10),
                    Textfield(
                      Controller: confirmpassword,
                      obscureText: true,
                      hintText: '',
                      label: 'Confirm Password',
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 70),
                    Buttons(
                      onTap: signUpUser,
                      color: const Color.fromARGB(255, 13, 183, 101),
                      label: 'Sign Up',
                      labelColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
