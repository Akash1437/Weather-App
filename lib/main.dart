import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home.dart';
//import 'package:weather_app/Activity/location.dart';
import 'package:weather_app/Activity/loading.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
//import 'package:flutter_weather_icons/flutter_weather_icons.dart';
void main() {
  runApp(
    MaterialApp(
     // home: Home(),

      routes: {
        "/":(context) =>Loading(),
        "/home" :(context) => Home(),
       // "/location" : (context) => Location(),
        "/loading" : (contxet) => Loading(),
      },
    )
  );
}


