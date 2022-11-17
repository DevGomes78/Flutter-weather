import 'package:flutter/material.dart';
import 'package:flutter_wheater/constants/string_constants.dart';
import '../service/wheater_api_service.dart';
import 'package:provider/provider.dart';

class TopCard extends StatefulWidget {
  const TopCard({Key? key}) : super(key: key);

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
    WeatherApi controller = WeatherApi();

  @override
  void initState() {
    controller = context.read<WeatherApi>();
    controller.getWeather();
    super.initState();
  }

  @override
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
                  child: Text(StringConstants.errorPage),
                );
              } else {
                return _topCard();
              }
          }
        });
  }

  _topCard() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 60,
            child: Text(
              controller.json['results']['city'],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 90,
            child: Text(
              controller.json['results']['date'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 130,
            top: 100,
            child: controller.json['results']['forecast'][0]['description'] ==
                    StringConstants.clearWeather
                ? const Icon(
                    Icons.sunny,
                    size: 150,
                    color: Colors.amber,
                  )
                : controller.json['results']['forecast'][0]['description'] ==
                        StringConstants.partlyCloud
                    ? const Icon(
                        Icons.cloud,
                        size: 150,
                        color: Colors.grey,
                      )
                    : controller.json['results']['forecast'][0]
                                ['description'] ==
                            StringConstants.Rain
                        ? const Icon(
                            Icons.cloudy_snowing,
                            size: 150,
                            color: Colors.grey,
                          )
                        : controller.json['results']['forecast'][0]
                                    ['description'] ==
                                StringConstants.scatteredRains
                            ? const Icon(
                                Icons.sunny_snowing,
                                size: 150,
                                color: Colors.amber,
                              )
                            : const Icon(
                                Icons.cloud,
                                size: 150,
                                color: Colors.grey,
                              ),
          ),
          Positioned(
            left: 180,
            top: 250,
            child: Text(
              '${controller.json['results']['forecast'][0]['max']} °',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 330,
            child: Text(
              StringConstants.forecastForWeek,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
