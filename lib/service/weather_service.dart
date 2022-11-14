import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../constants/service_constants.dart';
import '../models/weather_model.dart';

class WeatherService extends ChangeNotifier {
  List<Forecast> lista = [];
  var decodeJson;

  Future<List<Forecast>> getTempo() async {
    final response = await http.get(Uri.parse(ServiceConstants.baseUrl));
    if (response.statusCode == 200) {
      decodeJson = jsonDecode(response.body);
      decodeJson['results']['forecast']
          .forEach((item) => lista.add(Forecast.fromJson(item)));
      return lista;
    } else {
      return [];
    }
  }

  Future<List<Forecast>> getdate({required String query}) async {
    final response = await http.get(Uri.parse(ServiceConstants.baseUrl));
    if (response.statusCode == 200) {
      decodeJson = jsonDecode(response.body);
      decodeJson['results']['forecast']
          .forEach((item) => lista.add(Forecast.fromJson(item)));
      lista = lista
          .where(
            (e) => e.date!.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
          .toList();
      return lista;
    } else {
      return [];
    }
  }
}
