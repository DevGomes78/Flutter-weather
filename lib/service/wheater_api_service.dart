import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/wheater_models.dart';

class WeatherApi extends ChangeNotifier {
  var lista = [];
  String baseUrl = 'https://api.hgbrasil.com/weather?key=2360757e ';

  Future<Results?> getWeather() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);



    //lista = json.entries.map((e) => (e.value)).toList();
       json.forEach((key, value) =>lista.add(json[key].toString()));
     // lista = json.values.toList();
     // json.forEach((item) => lista.add(Results.fromJson(item)));
       //json.entries.map((e) => lista(e.key)).toList();
      notifyListeners();
    } else {
      throw Exception('erro');
    }
    return null;
  }
}
