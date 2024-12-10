import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'functions/rootView.dart';
import 'pages/app_login.dart';
import 'pages/dashboard.dart';
import 'pages/landingPage.dart';
import 'pages/tracker.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'firebase_options.dart';

List<CameraDescription> camera = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Rootview(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const Dashboard(),
        '/tracker': (context) => const Tracker(),
        '/landingPage': (context) => const Landingpage(),
      },
    );
  }
}
