import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey = '9774d2c955d95dacd0dd80c25bfd33eb'; 
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather'; 
  final String city;

  WeatherApi(this.city);

  Future<Map<String, dynamic>> getWeather() async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
