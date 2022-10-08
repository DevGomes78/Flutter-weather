import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/wheater_models.dart';

class WeatherApi extends ChangeNotifier {
  var json;
  var lista = [];
  var decodeJson;


  String baseUrl = 'https://api.hgbrasil.com/weather?key=2360757e ';

  Future<Results?> getWeather() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
    json = jsonDecode(response.body);
      notifyListeners();
    } else {
      throw Exception('erro');
    }
    return null;
  }

  Future<Forecast?> getWeather1() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodeJson  = jsonDecode(response.body);
      decodeJson.forEach((item)=> lista.add(Forecast.fromJson(item)));
      notifyListeners();
    } else {
      throw Exception('erro');
    }
    return null;
  }

}
