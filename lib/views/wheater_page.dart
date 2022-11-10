import 'package:flutter/material.dart';
import '../components/list_data.dart';
import '../components/weather_list.dart';
import '../service/wheater_api_service.dart';
import 'package:provider/provider.dart';

class WheaterPage extends StatefulWidget {
  const WheaterPage({Key? key}) : super(key: key);

  @override
  State<WheaterPage> createState() => _WheaterPageState();
}

class _WheaterPageState extends State<WheaterPage> {
  WeatherApi controller = WeatherApi();

  @override
  void initState() {
    controller = context.read<WeatherApi>();
    controller.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
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
                return Column(
                  children: [
                    _topcard(),
                    const SizedBox(height: 10),
                    //  const ListData(),
                    const SizedBox(height: 10),
                    Expanded(child: const WeatherList()),
                  ],
                );
              }
          }
        },
      ),
    );
  }

  _topcard() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 30,
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
            top: 60,
            child: Text(
              controller.json['results']['date'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            left: 120,
            top: 80,
            child: Icon(
              Icons.sunny,
              size: 80,
              color: Colors.amber,
            ),
          ),
          Positioned(
            left: 140,
            top: 170,
            child: Text(
              '${controller.json['results']['temp']} °',
              style: const TextStyle(
                fontSize: 35,
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
