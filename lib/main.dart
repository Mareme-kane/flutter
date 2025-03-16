import 'dart:async';
import 'dart:convert';
import 'package:appliflutter1/pages/HomePage.dart';
import 'package:appliflutter1/pages/bvn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:WelcomePage(),
    );
  }
}