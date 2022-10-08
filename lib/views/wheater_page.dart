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
  late final WeatherApi controller1;

  @override
  void initState() {
    controller = context.read<WeatherApi>();
    controller1 = context.read<WeatherApi>();
    controller.getWeather();
    controller1.getWeather1();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider= Provider.of<WeatherApi>(context);
    return Scaffold(
         body:
             Column(
               children: [
                 Text(controller.json["results"]["city"]),
                 const SizedBox(height: 10),
                 Container(
                   height: 300,
                   width: 200,
                   child: ListView.builder(
                   itemCount: controller1.lista.length,
                     itemBuilder: (context,index){
                     return ListTile(
                       title: Text(controller1.lista[index].toString()),
                     );
                     }),)


               ],
             ));


  }
}
