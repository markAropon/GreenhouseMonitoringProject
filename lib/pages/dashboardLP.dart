import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greenhouse_monitoring_project/pages/tracker.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';
import '../functions/weatherAPI.dart';
import '../utility_widgets/statusViews.dart';
import '../functions/rootView.dart';

class Dashboardlp extends StatefulWidget {
  const Dashboardlp({super.key});

  @override
  State<Dashboardlp> createState() => _DashboardlpState();
}

class _DashboardlpState extends State<Dashboardlp> {
  final String _city = 'Quezon City, PH';
  String _weatherDescription = '';
  double _temperature = 0.0;
  bool _isLoading = false;
  String icon = '';
  final String plantedOn =
      '${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}';
  final controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  Future<void> _fetchWeather() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final weatherData = await WeatherService().getWeather(_city);
      final description =
          weatherData['weather'][0]['description'].toLowerCase();
      setState(() {
        _weatherDescription = description;
        _temperature = weatherData['main']['temp'];
        _isLoading = false;
        icon = _getWeatherIcon(description);
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  String _getWeatherIcon(String description) {
    if (description.contains('cloud')) return 'assets/bgImages/cloudy.json';
    if (description.contains('sunny')) return 'assets/bgImages/sunny.json';
    if (description.contains('rain')) return 'assets/bgImages/rainy.json';
    return 'assets/bgImages/sunny.json';
  }

  Color _getBackgroundColor(String description) {
  }

  @override
  Widget build(BuildContext context) {
    // Get the background color based on the weather description
    Color backgroundColor = _getBackgroundColor(_weatherDescription);

    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        leading: null,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/aggreemoSymbol.png',
              fit: BoxFit.fill,
              height: 45,
              width: 35,
            ),
            const Text(
              'GREEMO',
              style: TextStyle(
                color: Color.fromARGB(255, 3, 219, 13),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            Container(
              decoration:
                  const BoxDecoration(color: CupertinoColors.transparent),
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/bellIcon.png',
                    height: 50,
                    width: 50,
                  ),
                  /* const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () async {
                      // Trigger the logout dialog
                      await logout(context);
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Colors.red,
                      size: 30,
                    ),
                  ) */
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 196, 214, 238),
      ),
 main
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '$_temperature°',
                                    style: const TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    _weatherDescription,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat('MMMM d, E')
                                        .format(DateTime.now()),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    _city,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
 main
              ),
            ),
          ),

          // FAB Circular Menu
          Align(
            alignment: Alignment.center,
            child: FabCircularMenuPlus(
              ringWidth: 70,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    print('Home');
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    print('Favorite');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
