import 'package:flutter/material.dart';
import 'package:flutter_wheater/models/weather_model.dart';
import 'package:provider/provider.dart';

import '../service/weather_service.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  late String tempo;
  WeatherService controller = WeatherService();


  @override
  void initState() {
    controller = context.read<WeatherService>();
    controller.getTempo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Forecast>>(
      future: controller.getTempo(),
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
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text('erro no appp'),
                ),
              );
            } else {
              return _weatherList();
            }
        }
      },
    );
  }

  _weatherList() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.lista.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){

            },
            child: Card(
              elevation: 5,
              child: Container(
                height: 100,
                width: 150,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Text(
                      controller.lista[index].weekday.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.lista[index].date.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    controller.lista[index].description.toString() ==
                            'Tempo limpo'
                        ? const Icon(
                            Icons.sunny,
                            size: 50,
                            color: Colors.amber,
                          )
                        : controller.lista[index].description.toString() ==
                                'Chuva'
                            ? const Icon(
                                Icons.cloudy_snowing,
                                size: 50,
                                color: Colors.grey,
                              )
                            : controller.lista[index].description.toString() ==
                                    'Chuvas esparsas'
                                ? const Icon(
                                    Icons.sunny_snowing,
                                    size: 50,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.cloud,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                    const SizedBox(height: 10),
                    Text(
                      '${controller.lista[index].max} °'.toString(),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
