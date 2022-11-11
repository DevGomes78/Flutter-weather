import 'package:flutter/material.dart';
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
                  child: Text('erro na pagina'),
                );
              } else {
                return _topCard();
              }
          }
        });
  }

  _topCard() {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 60,
            child: Text(
              controller.json['results']['city'],
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
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
                color: Colors.black,
              ),
            ),
          ),
          const Positioned(
            left: 130,
            top: 120,
            child: Icon(
              Icons.sunny,
              size: 150,
              color: Colors.amber,
            ),
          ),
          Positioned(
            left: 180,
            top: 280,
            child: Text(
              '${controller.json['results']['temp']} °',
              style: const TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 355,
            child: Text(
              'Previsão para semana',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
