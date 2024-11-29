// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

import 'package:intl/intl.dart';

import '../functions/weatherAPI.dart';
import '../utility_widgets/buttons.dart';
import '../utility_widgets/statusViews.dart';

class Dashboardlp extends StatefulWidget {
  const Dashboardlp({super.key});

  @override
  State<Dashboardlp> createState() => _DashboardlpState();
}

class _DashboardlpState extends State<Dashboardlp> {
  final String _city = 'Quezon City, PH';
  String _weatherDescription = '';
  double _temperature = 0.0;
  // ignore: unused_field
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
    if (description.contains('cloud')) return 'assets/weatherBG/cloudy.json';
    if (description.contains('sunny')) return 'assets/weatherBG/sunny.json';
    if (description.contains('rain')) return 'assets/weatherBG/rainy.json';
    return 'assets/weatherBG/sunny.json';
  }

  Color _getBackgroundColor(String description) {
    if (description.contains('cloud')) {
      return const Color.fromARGB(239, 44, 170, 255);
    }
    if (description.contains('sunny')) {
      return const Color.fromARGB(240, 80, 146, 203);
    }
    if (description.contains('rain')) {
      return const Color.fromARGB(255, 40, 65, 227);
    }
    return const Color.fromARGB(240, 80, 146, 203);
  }

  @override
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
              'assets/aggreemoSymbol.png',
              fit: BoxFit.fill,
              height: 45,
              width: 35,
            ),
            const Text(
              'GREEMO',
              style: TextStyle(
                color: Color.fromARGB(255, 6, 153, 14),
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Spacer(),
            Container(
                decoration:
                    const BoxDecoration(color: CupertinoColors.transparent),
                child:
                    Image.asset('assets/bellIcon.png', height: 50, width: 50)),
          ],
        ),
        backgroundColor: const Color.fromARGB(240, 248, 241, 241),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              backgroundColor.withOpacity(0.8),
              backgroundColor.withOpacity(0.9),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: Colors.blue),
          ),
          margin:
              const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 30),
          child: Container(
            margin:
                const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        bottom: -40,
                        right: -10,
                        child: Opacity(
                          opacity: 0.5,
                          child: Lottie.asset(
                            icon,
                            width: 200,
                            height: 200,
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
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                DateFormat('MMMM d, E').format(DateTime.now()),
                                style: const TextStyle(
                                  fontSize: 18,
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
                                  fontSize: 20,
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
                  const SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black)),
                    //child: Tracker(),
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(),
                    height: 200,
                    child: PageView(
                      controller: controller,
                      children: const [
                        Statusviews(),
                        Center(child: Text('More data here')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Buttons(
                    onTap: () {
                      controller.jumpToPage(1);
                    },
                    label: 'Monitoring',
                    color: Colors.green,
                    labelColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
