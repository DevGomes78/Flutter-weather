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
              return Container(
                color: Colors.white,
                height: 170,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.lista.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: SizedBox(
                        height: 100,
                        width: 150,
                        child: Column(
                          children: [
                            Text(
                              controller.lista[index].weekday.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              controller.lista[index].date.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 10),
                            controller.lista[index].description.toString() ==
                                    'Tempo limpo'
                                ? const Icon(
                                    Icons.sunny,
                                    size: 50,
                                    color: Colors.amber,
                                  )
                                : controller.lista[index].description
                                            .toString() ==
                                        'Chuva'
                                    ? const Icon(
                                        Icons.cloudy_snowing,
                                        size: 50,
                                        color: Colors.grey,
                                      )
                                    : controller.lista[index].description
                                                .toString() ==
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
                              controller.lista[index].description.toString(),
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
        }
      },
    );
  }
}
