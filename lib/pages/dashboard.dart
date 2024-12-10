import 'package:flutter/material.dart';
import 'app_login.dart';
import 'dashboardLP.dart';
import 'landingPage.dart';
import 'tracker.dart';
import 'user_profile.dart';

const String apiKey = '0741bbbfaa5554c40964fc241198e0e7';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Dashboardlp(),
    Tracker(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green, // Color when selected
        unselectedItemColor: Colors.blue, // Color when unselected
        items: [
          BottomNavigationBarItem(
            icon:
                Image.asset('assets/icons/Group127.png', width: 20, height: 20),
            label: 'Home',
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

Future<void> tracker(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Tracker()),
  );
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
