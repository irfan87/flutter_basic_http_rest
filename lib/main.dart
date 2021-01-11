import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_rest_api/main.dart';
import 'package:flutter_http_rest_api/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Homepage(),
    );
  }
}
