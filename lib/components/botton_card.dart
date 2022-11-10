import 'package:flutter/material.dart';
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Informaçoes adicionais',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              children: [
                                const Text(
                                  'Min',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Text(
                                  '${(controller.json['results']['forecast'][0]['min'])} °'
                                      .toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 50),
                                Row(
                                  children: [
                                    const Text(
                                      'Max',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 40),
                                    Text(
                                      '${(controller.json['results']['forecast'][0]['max'])} °'
                                          .toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              children: [
                                const Text(
                                  'Vento',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 40),
                                Text(
                                  '${(controller.json['results']['forecast'][0]['wind_speedy'])} °'
                                      .toString(),
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(width: 50),
                                Row(
                                  children: [
                                    const Text(
                                      'Condição',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 40),
                                    Text(
                                      '${(controller.json['results']['forecast'][0]['description'])} °'
                                          .toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
          }
        });
  }
}
