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
                return _bottonCard();
              }
          }
        });
  }

  _bottonCard() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Informaçoes adicionais',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          SizedBox(
            height: 160,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    children: [
                      const Text(
                        'Min',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 40),
                      Text(
                        '${(controller.json['results']['forecast'][0]['min'])} °'
                            .toString(),
                        style: const TextStyle(fontSize: 18,color: Colors.white,),
                      ),
                      const SizedBox(width: 75),
                      Row(
                        children: [
                          const Text(
                            'Max',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 40),
                          Text(
                            '${(controller.json['results']['forecast'][0]['max'])} °'
                                .toString(),
                            style: const TextStyle(fontSize: 18,color: Colors.white,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      const Text(
                        'Vento',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 25),
                      Text(
                        (controller.json['results']['forecast'][0]['wind_speedy']
                            .toString()),
                        style: const TextStyle(fontSize: 18,color: Colors.white,),

                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Text(
                            (controller.json['results']['forecast'][0]
                                    ['description'])
                                .toString(),
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white,),
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
      ),
    );
  }
}
