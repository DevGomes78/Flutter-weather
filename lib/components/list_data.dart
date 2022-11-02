import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../service/wheater_api_service.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  WeatherApi controller = WeatherApi();

  @override
  void initState() {
    controller = context.read<WeatherApi>();
    controller.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           children: [
             Row(
               children:  [
                 const Icon(Icons.thermostat,size: 20),
                 SizedBox(width: 20),
                 Text('Temperatura'),
                 SizedBox(width: 20),
                 Text(controller.json['results']['forecast'][0]['max'].toString())
               ],
             ),
             const SizedBox(height: 10),
             Row(
               children:  [
                 const Icon(Icons.cloud,size: 20),
                 SizedBox(width: 20),
                 Text('Tempo'),
                 SizedBox(width: 55),
                 Text(controller.json['results']['forecast'][0]['description'].toString())
               ],
             ),
             SizedBox(height: 10),
             Row(
               children:  [
                 const Icon(Icons.hub,size: 20),
                 SizedBox(width: 20),
                 Text('humidade'),
                 SizedBox(width: 55),
                 Text(controller.json['results']['forecast'][0]['cloudiness'].toString())
               ],
             ),
             SizedBox(height: 10),
             Row(
               children:  [
                 const Icon(Icons.wind_power,size: 20),
                 SizedBox(width: 20),
                 Text('Vento'),
                 SizedBox(width: 60),
                 Text(controller.json['results']['forecast'][0]['wind_speedy'].toString())
               ],
             ),
           ],
         ),
       ),
    );
  }
}
