import 'package:flutter/material.dart';

import 'HomePage.dart';

class CityDetailsPage extends StatefulWidget {
  final Map<String, dynamic> cityData;
  final Function(Map<String, dynamic>) onSelect;

  const CityDetailsPage({Key? key, required this.cityData, required this.onSelect}) : super(key: key);

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5842A9),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 22.0, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xff331C71),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Image(
                            height: 20,
                            width: 20,
                            color: Colors.white,
                            image: AssetImage('assets/images/menu1.png'),
                          ),
                        ),
                      ),
                      const Text(
                        'BIENVENUE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                      Container(
                        height: 40,
                        width: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xff331C71),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                Text(
                  widget.cityData['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:40,
                  ),
                ),
                Stack(
                  children: [
                    Text(
                      'Temperature: ${widget.cityData['main']['temp'].toStringAsFixed(0)}°C',
                      style: TextStyle(
                          fontSize:30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 65.0, top: 100),
                        child: Image(
                          height: 150,
                          image: AssetImage('assets/images/nuageux.png'),
                        ),
                      ),
                    )
                  ],
                ),
                const Text(
                  'Jeudi 01 Fevrier | 23.26 PM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                      color: const Color(0xff331C71),
                      borderRadius: BorderRadius.circular(12)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, left: 8),
                        child: Column(
                          children: [
                            Image(
                                height: 60,
                                image: AssetImage('assets/images/umbralla.png')),
                            Text(
                              '30°',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'Precipitation',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Column(
                          children: [
                            Image(
                                height: 60,
                                image: AssetImage('assets/images/drop.png')),
                            Text(
                              '20°',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'Humidite',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0, right: 8),
                        child: Column(
                          children: [
                            Image(
                                height: 60,
                                image: AssetImage('assets/images/wind.png')),
                            Text(
                              '9Km/h',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              'Vitesse Du Vent',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hier',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                    Text(
                      'Previsions sur 7-jours',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff331C71),
                            borderRadius: BorderRadius.circular(19)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 18.0, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '10 AM',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Image(
                                  height: 40,
                                  image:
                                  AssetImage('assets/images/cloud.png')),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '23°',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Container(
                        height: 120,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff331C71),
                            borderRadius: BorderRadius.circular(19)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 18.0, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '11 AM',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Image(
                                  height: 40,
                                  image:
                                  AssetImage('assets/images/nuageux.png')),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '20°',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Container(
                        height: 120,
                        width: 70,
                        decoration: BoxDecoration(
                            color: const Color(0xff331C71),
                            borderRadius: BorderRadius.circular(19)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 18.0, right: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  '12 AM',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Image(
                                  height: 50,
                                  image:
                                  AssetImage('assets/images/cloudy.png')),
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    '19°',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
