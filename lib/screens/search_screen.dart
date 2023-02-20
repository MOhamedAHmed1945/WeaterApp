
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_providers.dart';
import '../services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  //SearchPage({Key? key,this.cityName}) : super(key: key);
  String? cityName;
  SearchScreen({super.key,this.updateUi});
  VoidCallback? updateUi;

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
            onSubmitted: (data) async{
              cityName = data;
              WeatherServices services = WeatherServices();
             WeatherModel weather =
               await services.getWeather(cityName: cityName!);
              print(weather);
              //weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
             // updateUi!();
             Navigator.pop(context);
             },
          ),
        ),
      ),
    );
  }
}
