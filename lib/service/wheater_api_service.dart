import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';


class WeatherApi extends ChangeNotifier {
  var json;

  Future<Results?> getWeather() async {
    final url = Uri.parse('https://api.hgbrasil.com/weather?key=90d42896');
    final response = await http.get(url);
    if (response.statusCode == 200) {
    json = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('erro');
    }
    return null;
  }
  }


