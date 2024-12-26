import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherData = 'Fetching weather data...';

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Coimbatore&appid=07b41de7463fe54f44366e5f44f2a932'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        weatherData = 'Temperature: ${data['main']['temp']} K\n'
            'Humidity: ${data['main']['humidity']}\n'
            'Forecast: ${data['weather'][0]['description']}';
      });
    } else {
      setState(() {
        weatherData = 'Failed to fetch weather data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.cloud, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Weather Data',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            Text(
              weatherData,
              style: TextStyle(fontSize: 18, color: Colors.blue[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
