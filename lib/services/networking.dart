import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final Uri url;
  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}

/*
Uri.http('api.openweathermap.org', '/data/2.5/weather', {
      "lat": latitude.toString(),
      "lon": longitude.toString(),
      "appid": apiKey,
    })

    */
