import 'package:flutter/material.dart';
import 'different_city.dart';
// import 'package:http/http.dart' as http;
import 'weather_control.dart';
import 'background.dart';

class MainScreen extends StatefulWidget {
  MainScreen({this.getWeatherData});

  final getWeatherData;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  int temprature;
  String weathericon;
  String stringText;
  String cityname;
  String backgroundimg;
  WeatherControl weather = WeatherControl();
  WeatherModal w = WeatherModal();
  void initState() {
    super.initState();
    print(widget.getWeatherData);
    updateUI(widget.getWeatherData);
  }

  void updateUI(weatherData) {
    setState(() {
      if (weatherData == null) {
        temprature = 0;
        weathericon = 'ERROR';
        stringText = 'Unable to get data';
        cityname = '';
        backgroundimg = 'black';
        return;
      }
      double temp = weatherData['main']['temp'].toDouble();
      temprature = temp.toInt();
      int condition = weatherData['weather'][0]['id'];
      weathericon = w.getWeatherIcon(condition);
      backgroundimg = w.backgroundImage(condition);
      stringText = weather.getText(temprature);
      cityname = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know your weather!'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BackgroundImg(
        bgimg: backgroundimg,
        wigetChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$temprature°C',
                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  '$weathericon',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                '$stringText in $cityname',
                style: TextStyle(
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: FlatButton(
                onPressed: () async {
                  var weatherdata = await w.getCurrentWeather();
                  updateUI(weatherdata);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.navigation,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Check weather at your loaction'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey,
              ),
              child: FlatButton(
                onPressed: () async {
                  var typedName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WeatherOfCity();
                      },
                    ),
                  );
                  print(typedName);
                  if (typedName != null) {
                    var weatherData =
                        await w.getCityWeather(cityname: typedName);
                    updateUI(weatherData);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_city_sharp,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text('Check weather of another city'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
