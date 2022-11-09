import 'package:flutter/material.dart';
import 'package:flutter_wheater/models/weather_model.dart';
import 'package:provider/provider.dart';

import '../service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherService controller = WeatherService();

  @override
  void initState() {
    controller = context.read<WeatherService>();
    controller.getTempo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Forecast>>(
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
                return Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width - 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.decodeJson['results']['temp' + '°']
                                .toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            controller.decodeJson['results']['city_name']
                                .toString(),
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
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
                                  Text(controller.lista[index].date.toString()),
                                  const SizedBox(height: 10),
                                  Text(controller.lista[index].weekday
                                      .toString()),
                                  const SizedBox(height: 10),
                                  Text(controller.lista[index].max.toString()),
                                  const SizedBox(height: 10),
                                  Text(controller.lista[index].min.toString()),
                                  const SizedBox(height: 10),
                                  Text(controller.lista[index].description
                                      .toString()),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
          }
        },
      ),
    );
  }
}
