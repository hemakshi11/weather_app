import 'package:http/http.dart' as http;
import 'package:weather_app/Getting_data.dart';
import 'package:weather_app/networking.dart';

const kApiKEy = '38c9d6230af1a3220d0648bb97db5947';

class WeatherModal {
  Future getCityWeather({cityname}) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$kApiKEy&units=metric');
    var weatherData = await networkHelper.getDecodedData();
    return weatherData;
  }

  Future getCurrentWeather() async {
    GetLocation location = GetLocation();
    await location.getCurrrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKEy&units=metric');
    var weatherData = await networkHelper.getDecodedData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 500.0) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String backgroundImage(int condition) {
    if (condition < 300) {
      return 'sky_thunderstrom';
    } else if (condition < 500) {
      return 'sky_drizzel';
    } else if (condition < 600) {
      return 'sky_rain';
    } else if (condition < 700) {
      return 'sky_snow';
    } else if (condition <= 800) {
      return 'sky_sunny';
    } else if (condition <= 804) {
      return 'sky_cloudy';
    } else {
      return 'black‍';
    }
  }
}

class WeatherControl {
  String getText(int temp) {
    if (temp > 25) {
      return ('Looks like a cup of ice-cream won\'t hurt');
    } else if (temp > 20) {
      return ('Time to wear shorts');
    } else if (temp < 10) {
      return ('Don\'t forget to wear a sweater');
    } else {
      return ('Just take a warm piece of clothing w you. Just in case!');
    }
  }
}
