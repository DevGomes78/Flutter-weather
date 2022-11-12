import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService extends ChangeNotifier {
  List<Forecast> lista = [];
  var decodeJson;

  Future<List<Forecast>> getTempo() async {
    final response = await http
        .get(Uri.parse('https://api.hgbrasil.com/weather?key=90d42896'));
    if (response.statusCode == 200) {
      decodeJson = jsonDecode(response.body);
      decodeJson['results']['forecast']
          .forEach((item) => lista.add(Forecast.fromJson(item)));
      return lista;
    } else {
      return [];
    }
  }
  Future<List<Forecast>> getCity() async {
    final response = await http
        .get(Uri.parse('https://api.hgbrasil.com/weather?key=90d42896e'));
    if (response.statusCode == 200) {
      decodeJson = jsonDecode(response.body);
      decodeJson['results']['forecast']
          .forEach((item) => lista.add(Forecast.fromJson(item)));
      return lista;
    } else {
      return [];
    }
  }
}
