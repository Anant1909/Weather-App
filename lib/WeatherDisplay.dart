// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:weather_app/weather_api.dart';

class WeatherDisplay extends StatefulWidget {
  final String city;

  const WeatherDisplay(this.city, {super.key});

  @override
  _WeatherDisplayState createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  late Future<Map<String, dynamic>> weatherData;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherApi(widget.city).getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        centerTitle: true,
        title: const Text('Weather'),
      ),
      body: Center(
        child: FutureBuilder(
          future: weatherData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final weatherData = snapshot.data as Map<String, dynamic>;
              final temperatureInKelvin = weatherData['main']['temp'];
              final temperatureInCelsius = temperatureInKelvin - 273.15;
              final humidity = weatherData['main']['humidity'];
              final windSpeed = weatherData['wind']['speed'];
              final cityName = weatherData['name'];

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'City: $cityName',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     const Icon(
                        Icons.wb_sunny,
                        size: 50,
                      ),
                      Text(
                        '${temperatureInCelsius.toStringAsFixed(2)}°C',
                        style:const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.water,
                        size: 30,
                      ),
                      Text(
                        'Humidity: $humidity%',
                        style:const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.air,
                        size: 30,
                      ),
                      Text(
                        'Wind Speed: $windSpeed m/s',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
