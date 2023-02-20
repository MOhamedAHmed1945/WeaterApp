
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/weather_model.dart';
import '../providers/weather_providers.dart';

class CaseNotNull extends StatelessWidget {
  CaseNotNull({Key? key}) : super(key: key);
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context,listen: true).weatherData;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              weatherData!.getThemeColor()!,
              weatherData!.getThemeColor()![300]!,
              weatherData!.getThemeColor()![100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      //color: weatherData!.getThemeColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
          Text(
            Provider.of<WeatherProvider>(context).cityName!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage().toString()),
              Text(
                weatherData!.temp.toString(),
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp : ${
                        weatherData!.maxTemp?.toInt()
                    }',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 3.5,),
                  Text(
                    'minTemp : ${
                        weatherData!.minTemp?.toInt()
                    }',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            weatherData!.weatherStateName!,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(flex: 5,),
        ],
      ),
    );
  }
}