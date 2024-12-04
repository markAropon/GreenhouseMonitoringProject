import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _SignupState();
}

class _SignupState extends State<UserProfile> {
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizes
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Ensures UI is resized when the keyboard appears
      backgroundColor: const Color.fromARGB(255, 220, 224, 230),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 220, 224, 230),
      ),

      body: SingleChildScrollView(
        // Ensures scrolling when the keyboard appears
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: screenHeight * 1,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 196, 214, 238), // Light Steel Blue
                      Color.fromARGB(255, 48, 98, 139), // Steel Blue
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      // CircleAvatar with user icon inside
                      CircleAvatar(
                        radius: 50, // Circular radius
                        backgroundColor:
                            Colors.blue, // Background color of the circle
                        child: Icon(
                          Icons.person,
                          size: 70,
                          color: Colors.white, // Icon color
                        ),
                      ),
                      SizedBox(height: 30),
                      // Name "JUAN DELA CRUZ" centered below the icon
                      Text(
                        "JUAN DELA CRUZ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
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
