import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Delhi"; // 16:39  video 26th ....
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    air_speed = instance.air_speed;
    description = instance.description;
    temp = instance.temp;
    main = instance.main;
    humidity = instance.humidity;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": humidity,
        "air_speed_value": air_speed,
        "description_value": description,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });

    // ignore: use_build_context_synchronously
  }

  @override
  void initState() {
    // TODO: implement initState
    //startApp(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  debugCheckBanner:false;

    //Map search = ModelRoute.of(context).settings.arguments;
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 190,
                ),
                Image.asset(
                  "assets/images/w5.png",
                  height: 140,
                  width: 150,
                  colorBlendMode: BlendMode.darken,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/images/w4.png'),
                //  radius: 60,),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Weather App",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Made by Aakash",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 12),
                SpinKitDoubleBounce(
                  color: Colors.grey[200],
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
