import 'package:flutter/material.dart';

class WeatherOfCity extends StatefulWidget {
  @override
  _WeatherOfCityState createState() => _WeatherOfCityState();
}

class _WeatherOfCityState extends State<WeatherOfCity> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Know your weather!'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  icon: Icon(
                    Icons.location_city_sharp,
                    color: Colors.white,
                  ),
                  hintText: 'ENTER CITY NAME',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text('CHECK WEATHER!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
