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
    final provider = Provider.of<WeatherApi>(context);
    print(provider.lista);
    return Scaffold(
         body: provider.lista.isNotEmpty?
             ListView.builder(
               itemCount: provider.lista.length,
                 itemBuilder: (context,index){
               var  list = provider.lista[index];
                 return ListTile(
                   title:  Text(list.toString()),
                 );
                 })
             : const Center(
           child: CircularProgressIndicator(),
         ));

  }
}
