import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const apiKey = '115d4295ea46b422e0a46647cb1532b4';

class WeatherModel {
  Future getCityName(String cityName) async {
    Uri url = Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      "q": cityName,
      "appid": apiKey,
      "units": "metric",
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper =
        NetworkHelper(Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      "lat": location.latitude.toString(),
      "lon": location.longitude.toString(),
      "appid": apiKey,
      "units": "metric",
    }));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
