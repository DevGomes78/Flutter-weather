import 'package:flutter/material.dart';
import 'package:flutter_wheater/views/tempo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wheater App'),
      ),
      body: const WeatherPage(),
    );
  }
}
