import 'package:flutter/material.dart';
import 'package:flutter_wheater/constants/string_constants.dart';
import 'package:flutter_wheater/models/weather_model.dart';
import 'package:flutter_wheater/views/details_page.dart';
import 'package:provider/provider.dart';

import '../service/weather_service.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  State<WeatherList> createState() => _WeatherListState();
}

class _WeatherListState extends State<WeatherList> {
  late String tempo;
  Results results = Results();
  WeatherService controller = WeatherService();
  WeatherService date = WeatherService();

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
                  child: Text(StringConstants.errorPage),
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
      height: MediaQuery.of(context).size.height / 4.5,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.lista.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(forecast: controller.lista[index])));
            },
            child: Card(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 100,
                width: 150,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Text(
                      controller.lista[index].weekday.toString(),
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.lista[index].date.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    controller.lista[index].description.toString() ==
                            StringConstants.clearWeather
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
                                    StringConstants.scatteredRains
                                ? const Icon(
                                    Icons.sunny_snowing,
                                    size: 50,
                                    color: Colors.amber,
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
                          color: Colors.white),
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
