import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Placeholder values for USERNAME, EMAIL, and PHONE
  String username = "";
  String email = "";
  String phone = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fetch user data from FirebaseAuth
  Future<void> getUserData() async {
    User? user = _auth.currentUser; // Get the currently authenticated user

    if (user != null) {
      setState(() {
        username =
            user.displayName ?? 'No Username'; // Get username from FirebaseAuth
        email = user.email ?? 'No Email'; // Get email from FirebaseAuth
        phone = user.phoneNumber ??
            'No Phone'; // Get phone number from FirebaseAuth
      });
    } else {
      // If no user is signed in, handle the case appropriately
      setState(() {
        username = 'No user logged in';
        email = 'No user logged in';
        phone = 'No user logged in';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData(); // Fetch user data when the widget is loaded
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 220, 224, 230),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text('User Profile'),
        backgroundColor: const Color.fromARGB(255, 220, 224, 230),
      ),
      body: SingleChildScrollView(
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
                      Color.fromARGB(255, 48, 98, 139),
                      Color.fromARGB(255, 196, 214, 238),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        child: Text(
                          username.isEmpty ? "Loading..." : username,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        decoration: const BoxDecoration(),
                        child: const Text(
                          "Volunteer Farmer",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Display USERNAME, EMAIL, and PHONE from FirebaseAuth
                      Center(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "USERNAME :",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        username.isEmpty
                                            ? "Loading..."
                                            : username,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text(
                                    "EMAIL :",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        email.isEmpty ? "Loading..." : email,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text(
                                    "PHONE :",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        phone.isEmpty ? "Loading..." : phone,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
