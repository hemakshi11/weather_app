import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/main_screen.dart';
import 'package:weather_app/weather_control.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    ),
  );
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getlocationdata();
  }

  void getlocationdata() async {
    var currentData = await WeatherModal().getCurrentWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MainScreen(
            getWeatherData: currentData,
          );
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sky_clouds.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
