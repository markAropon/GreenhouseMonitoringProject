import 'package:flutter/material.dart';
import 'app_login.dart';
import 'dashboardLP.dart';
import 'landingPage.dart';
import 'tracker.dart';

const String apiKey = '0741bbbfaa5554c40964fc241198e0e7';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController pageController = PageController();
  int _selectedIndex = 0;

  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    Text('!st Screen'),
    Text('2nd Screen'),
    Text('3rd Screen'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          const Dashboardlp(),
          const Tracker(),
          SizedBox(
<<<<<<< HEAD
            child: Image.asset('assets/icons/group127.png'),
          ),
          SizedBox(
            child: Image.asset('assets/icons/group152.png'),
=======
            child: Image.asset('assets/group127.png'),
          ),
          SizedBox(
            child: Image.asset('assets/group152.png'),
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
<<<<<<< HEAD
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
=======
            icon: Image.asset('assets/Group127.png', width: 20, height: 20),
            label: 'HomePage',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Group152.png', width: 20, height: 20),
            label: 'Monitoring',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/account_box.png', width: 20, height: 20),
>>>>>>> 3f87042ab3e85ba53bb8da5bb8e17ecb2880fed1
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
