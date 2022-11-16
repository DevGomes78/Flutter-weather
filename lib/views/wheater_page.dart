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
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.black])
        ),
        child: ListView(
          children: const [
            TopCard(),
            Divider(color: Colors.grey),
            WeatherList(),
            Divider(color: Colors.grey),
            SizedBox(height: 10),
            BottonCard(),
            Divider(color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
