import 'package:flutter/material.dart';
import '../components/botton_card.dart';
import '../components/top_card.dart';
import '../components/weather_list.dart';


class WheaterPage extends StatefulWidget {
  const WheaterPage({Key? key}) : super(key: key);

  @override
  State<WheaterPage> createState() => _WheaterPageState();
}

class _WheaterPageState extends State<WheaterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Column(
        children: const [
          TopCard(),
          WeatherList(),
          SizedBox(height: 20),
          BottonCard(),
        ],
      ),
    );
  }
}
