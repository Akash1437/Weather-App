//will make   a class - different methods
// will make instanceto get different -different data;

import 'dart:convert';

import 'package:http/http.dart';

class worker {
  String? location;
  //constructor

  worker({this.location}) {
    // use { } to make parameter named parameter instede of posiitional parameter
    location = this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  // method =
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          //"https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=59b2fd4dc772b630c234fffef876602e"));
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=59b2fd4dc772b630c234fffef876602e"));
      Map data = jsonDecode(response.body);

      print(data);
      Map temp_data = data['main']; // *c

      Map wind_data = data['wind']; //km/hr
      //getting temp,desc,humidity;
      List weather_data = data['weather'];
      Map main_weather_data = weather_data[0];

      String getMain_data = main_weather_data['main'];
      String getData_desc = main_weather_data['description'];
      double getTemp = temp_data['temp'] - 273.15;
      int getHum_data = temp_data['humidity'];

      // print(icon);
      //getting wind speed;

      double getWind_speed = wind_data['speed'] / 0.277778;

      // assigning values //''''
      temp = getTemp.toString(); //*c
      humidity = getHum_data.toString(); //%
      air_speed = getWind_speed.toString(); // km/hr
      description = getData_desc.toString(); //
      main = getMain_data.toString();
      icon = main_weather_data["icon"].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "can't find data";
      main = "NA";
      icon = "03n";
    }
  }
}
// creating instances

// worker instance = worker(location: "Mumbai");
// instance.temp
