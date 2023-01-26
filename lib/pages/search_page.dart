
import 'package:flutter/material.dart';
import '../services/weather_services.dart';

class SearchPage extends StatelessWidget {
  //SearchPage({Key? key,this.cityName}) : super(key: key);
  String? cityName;
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 27,
                horizontal: 24,
              ),
              border: OutlineInputBorder(),
              label: Text(
                  'Search'
              ),
              hintText: 'Enter City',
              suffix: Icon(
                Icons.search,
              ),
            ),
            onSubmitted: (data) {
              cityName = data;
              WeatherServices services = WeatherServices();
              services.getWeather(cityName: cityName!);
            },

          ),
        ),
      ),
    );
  }
}
