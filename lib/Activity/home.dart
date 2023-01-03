// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart';
//import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
//date 11 nov 2022
//date 11 november

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  //call init method in 2nd class & above override.
// void timer(){
//   //process should wait 5 secs;
//   Future.delayed(Duration(seconds : 3),(){
//     print('allarm is riinging');
//   });
//   print("u can do other stuff too.");
// }
//String? get ;
// void getData() async
// //getdata func works like facebook login screen when u ennyter  ur user name & password then this func get your data from servser an d shhow in ur screen ;
// {
//   // some process is running in background
//   await Future.delayed(Duration(seconds: 3),(){
//     username = "vikas";
//   });
// print("$username");
// }
// void showData(){
//   print("$username");
// }
// video 07 & time 10 min;
//   void getData() async
//  {//get data
//    Response response = await get(Uri.parse('https://mytimeapi.herokuapp.com/time/Asia/Kolkata'));
//    Map data = jsonDecode(response.body) as Map;
//    print(data['city']);
//  }

  // List weather_data = data['weather'];
  // Map data_weather_data = weather_data[0];
  // print(weather_data);
  // print(data_weather_data['main']);

  // Map data = jsonDecode(response.body);
  // Map data_wind= data['wind'];
  // print(data_wind);
  // double speed_data= data_wind['speed'];
  // int data_deg = data_wind['deg'];
  //
  // print(data_deg);
  //   print(speed_data);

  // int data_base = data['id'];
  // print(data_base);

  //int counter = 1;
  @override
  void initState() {
    super.initState();
    //  //getData();
    //   //showData();
    print("this is a init state");
    //   //Color(colors
    //   );
    //   //timer();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("set state");
  }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "Delhi", "Chennai", "Dhar", "Indore", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    // var ModelRoute;
    // Map info = ModelRoute.of(context).setting.arguments;
    // var settings;
    //Map info = Modal
    // ModalRoute.of(context).settings.name == null;
    //main lines code imp see below line
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;

    //String temp = (((info!['temp_value']).toString()).substring(0, 4));
    String temp = (((info!['temp_value']).toString()));
    String air = (((info!['air_speed_value']).toString()));
    if (temp == "NA") {
      print("NA");
    } else {
      temp = (((info!['temp_value']).toString()).substring(0, 4));
      air = (((info!['air_speed_value']).toString()).substring(0, 4));
    }

    String icon = info['icon_value'];
    // print(icon);
    String getcity = info['city_value'];
    String hum_value = info['hum_value'];
    //String air = (((info!['air_speed_value']).toString()).substring(0, 3));

    String des = info['description_value'];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
          gradient: LinearGradient(colors: [
            Colors.blue.shade600,
            Colors.blue.shade300,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                //FOR GRADENTS
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.7,
              ],
              colors: [
                Colors.blue,
                Colors.blue.shade200,
              ],
              //FOR GRADIENTS
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  //search container
                  //color: Colors.grey,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(24)),

                  //child: Container(
                  //height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll("", " ") ==
                              " ") {
                            print("blank search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            color: Colors.lightBlue,
                          ),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),

                      //       SizedBox(height: 50,),
                      // Text("Search"),

                      Expanded(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                        height: 55,
                        child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search $city")),
                      ))
                    ],
                  ),
                ),
                //FOR Transparent containers in which u retrive data from API
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        child: Row(children: [
                          Image.network(
                            "http://openweathermap.org/img/wn/$icon@2x.png",
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Column(
                            children: [
                              Text(
                                "$des",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              Text(
                                " in $getcity",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.black54
                                ),
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
                //FOR Transparent containers in which u retrive data from API              //FOR Transparent containers in which u retrive data from API
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.hot),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$temp",
                                      style: TextStyle(fontSize: 70),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "temp",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.white24,
                                      ),
                                    ),
                                    //
                                    Text(
                                      "°C",
                                      style: TextStyle(fontSize: 35),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // new container

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.day_windy),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$air",
                                      style: TextStyle(fontSize: 28),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "km/hr",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "air speed",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        height: 150,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(6, 0, 20, 0),
                        padding: EdgeInsets.all(20),
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.humidity),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$hum_value",
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "percent",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " humidity",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 59,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Made By Aakash",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text("Data Provided By Openweathermap.org")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
//}
//single child scollview video 28 time 11:15
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Column(
//         children: [
//           FloatingActionButton(onPressed: (){
//             Navigator.pushNamed(context,"/location");
//
//           }),
//         ],
//       )),
//     );
}
// }
