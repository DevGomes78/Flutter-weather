import 'package:flutter/material.dart';
import '../components/list_data.dart';
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
                    const ListData(),
                    const SizedBox(height: 10),

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
      alignment: Alignment.center,
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            controller.json['results']['city'],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${controller.json['results']['temp']} °',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            controller.json['results']['description'],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
