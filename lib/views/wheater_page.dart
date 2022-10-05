import 'package:flutter/material.dart';
import 'package:flutter_wheater/models/wheater_models.dart';
import '../service/wheater_api_service.dart';
import 'package:provider/provider.dart';
class WheaterPage extends StatefulWidget {
  const WheaterPage({Key? key}) : super(key: key);

  @override
  State<WheaterPage> createState() => _WheaterPageState();
}

class _WheaterPageState extends State<WheaterPage> {


  late final WeatherApi controller;

  @override
  void initState() {
    controller = context.read<WeatherApi>();
    controller.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Results>(context);
    return Scaffold(
         body: Center(
           child:Text(provider.cityName.toString()),

         ),
    );
  }
}
