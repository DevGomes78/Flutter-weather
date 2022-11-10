import 'package:flutter/material.dart';

import '../service/weather_service.dart';
import 'package:provider/provider.dart';

import '../service/wheater_api_service.dart';

class BottonCard extends StatefulWidget {
  const BottonCard({Key? key}) : super(key: key);

  @override
  State<BottonCard> createState() => _BottonCardState();
}

class _BottonCardState extends State<BottonCard> {
  WeatherApi controller = WeatherApi();

  @override
  void initState() {
    controller = context.read<WeatherApi>();
    controller.getWeather();
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: controller.getWeather(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('erro na pagina'),
                );
              } else {
                return Container(
                  height: 240,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Text('Informaçoes adicionais'),
                      SizedBox(height: 10),
                      Divider(color: Colors.grey),
                      Container(
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text('Min'),
                                SizedBox(width: 20),
                                Text(controller.json['results']['forecast'][0]
                                    ['min'].toString())
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
          }
        });
  }
}
