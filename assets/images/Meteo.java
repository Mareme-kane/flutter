import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'detailpage.dart';

class Meteo extends StatefulWidget {
  const Meteo({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<Meteo> {
  Timer? t;
  int progression = 0;
  int i = 0;
  List<Map<String, dynamic>> tabville = List.filled(6, {});
  bool verifier = false;
  final villes = ['Touba', 'Paris', 'Nantes', 'Bordeaux', 'Lyon', 'Dakar'];

  List<String> messages = [
    'Nous téléchargeons les données…',
    'C’est presque fini…',
    'Plus que quelques secondes avant d’avoir le résultat…'
  ];

  @override
  void initState() {
    super.initState();
    fetchWeather();
    t = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        if (i < 5) {
          i++;
          fetchWeather();
        } else {
          i = 0;
          fetchWeather();
        }
      });
    });
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (progression < 60) {
          progression++;
        } else {
          verifier = true;
        }
      });
    });
    Timer.periodic(const Duration(seconds: 6), (timer) {
      setState(() {
        _messageIndex = (_messageIndex + 1) % messages.length;
      });
    });
  }

  @override
  void dispose() {
    t?.cancel();
    super.dispose();
  }

  Future<void> fetchWeather() async {
    const apiKey = '17b1be54a03ea860b80ef1109c89c4fb';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=${villes[i]}&appid=$apiKey';

    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double tempCelsius = (data['main']['temp'] - 273.15);
        data['main']['temp'] = tempCelsius;
        setState(() {
          tabville[i] = data;
        });
      } else {
        print(
            'Failed to fetch weather data for ${villes[i]}: ${response.statusCode}');
      }
    } catch (error) {
      print('Failed to fetch weather data for ${villes[i]}: $error');
    }
  }

  Icon getWeatherIcon(String weatherDescription) {
    switch (weatherDescription.toLowerCase()) {
      case 'clouds':
        return Icon(Icons.cloud);
      case 'clear':
        return Icon(Icons.wb_sunny);
      case 'rain':
        return Icon(Icons.grain);
      case 'snow':
        return Icon(Icons.ac_unit);
      default:
        return Icon(Icons.wb_cloudy);
    }
  }

  int _messageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touba_Meteo'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (!verifier)
                SizedBox(
                  height: 200,
                  child: Card(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            villes[i],
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            tabville[i] != null &&
                                tabville[i]['main'] != null &&
                                tabville[i]['main']['temp'] != null
                                ? '${tabville[i]['main']['temp'].toStringAsFixed(0)}°C'
                                : '...°C',
                            style: const TextStyle(
                                fontSize: 60, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              LinearProgressIndicator(value: progression / 60),

              if (verifier)
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      if (tabville[index] != null &&
                          tabville[index]['main'] != null &&
                          tabville[index]['main']['temp'] != null) {
                        return Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            leading: getWeatherIcon(
                                tabville[index]['weather'][0]['main']),
                            title: Text(villes[index]),
                            subtitle: Text(
                              'Temperature: ${tabville[index]['main']['temp'].toStringAsFixed(0)}°C',
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CityDetailsPage(
                                    cityData: tabville[index],
                                    onSelect: (data) {
                                      // Handle the selection if needed
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            title: Text(villes[index]),
                            subtitle: const Text('Weather data not available'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              if (verifier)
                ElevatedButton(
                onPressed: () {
                  setState(() {
                    progression = 0;
                    verifier = false;
                    tabville = List.filled(6, {});
                  });
                },
                child: const Text('Recommencer'),
              ),
              if (verifier)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    messages[_messageIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
