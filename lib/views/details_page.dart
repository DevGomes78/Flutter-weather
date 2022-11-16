import 'package:flutter/material.dart';
import 'package:flutter_wheater/models/weather_model.dart';

import '../constants/string_constants.dart';

class DetailsPage extends StatefulWidget {
  Forecast forecast;

  DetailsPage({required this.forecast});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.blueAccent])),
        child: _details(context),
      ),
    );
  }

  _details(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20,
          top: 40,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: (const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 30,
            )),
          ),
        ),
        const Positioned(
          left: 20,
          top: 100,
          child: Text(
            StringConstants.state,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: 140,
          child: Text(
            ' ${widget.forecast.date.toString()},',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Positioned(
          left: 90,
          top: 140,
          child: Text(
            widget.forecast.weekday.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        Positioned(
          left: 100,
          top: 250,
          child: (widget.forecast.description.toString() ==
                  StringConstants.clearWeather
              ? const Icon(
                  Icons.sunny,
                  size: 200,
                  color: Colors.amber,
                )
              : widget.forecast.description.toString() ==
                      StringConstants.partlyCloud
                  ? const Icon(
                      Icons.cloud,
                      size: 200,
                      color: Colors.grey,
                    )
                  : widget.forecast.description.toString() ==
                          StringConstants.Rain
                      ? const Icon(
                          Icons.cloudy_snowing,
                          size: 200,
                          color: Colors.grey,
                        )
                      : widget.forecast.description.toString() ==
                              StringConstants.scatteredRains
                          ? const Icon(
                              Icons.sunny_snowing,
                              size: 200,
                              color: Colors.amber,
                            )
                          : const Icon(
                              Icons.cloud,
                              size: 200,
                              color: Colors.grey,
                            )),
        ),
        Positioned(
          left: 120,
          top: 470,
          child: Text(
            widget.forecast.description.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          left: 150,
          top: 520,
          child: Text(
            ' ${widget.forecast.max.toString()}°',
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
