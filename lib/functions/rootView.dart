// ignore_for_file: unused_element

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/dashboard.dart';
import '../pages/landingPage.dart';
//import 'package:greenhouse/pages/app_login.dart';

class Rootview extends StatelessWidget {
  const Rootview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // User is logged in, show Dashboard
            if (snapshot.hasData) {
              return const Dashboard();
            } else {
              return const Landingpage();
            }
          }
          // Show a loading indicator while checking the auth state
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.topSlide,
    title: 'Are You Sure You Want To LogOut?',
    btnOkText: 'Yes', // Text for the left button
    btnCancelText: 'Cancel', // Text for the right button
    btnOkColor: Colors.green, // Green background for Yes button
    btnCancelColor: Colors.red, // Red background for Cancel button
    btnOkOnPress: () async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed('/landingPage');
    },
    btnCancelOnPress: () {},
  ).show();
}
