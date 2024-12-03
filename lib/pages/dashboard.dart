import 'package:flutter/material.dart';
import 'package:greenhouse_monitoring_project/pages/dleetafter.dart';
import 'app_login.dart';
import 'dashboardLP.dart';
import 'landingPage.dart';

const String apiKey = '0741bbbfaa5554c40964fc241198e0e7';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // PageController to control the PageView
  PageController pageController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          Dashboardlp(), // HomePage widget
          Dleetafter(), // Monitoring widget
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon:
                Image.asset('assets/icons/Group127.png', width: 20, height: 20),
            label: 'HomePage',
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset('assets/icons/Group152.png', width: 20, height: 20),
            label: 'Monitoring',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/account_box.png',
                width: 20, height: 20),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Handle item tap event
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
}

void main() {
  runApp(MaterialApp(
    home: const Dashboard(),
    routes: {
      '/login': (context) => const LoginScreen(),
      '/landingPage': (context) => const Landingpage(),
    },
  ));
}
