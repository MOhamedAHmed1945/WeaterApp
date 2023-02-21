
import 'package:flutter/material.dart';

class WeatherModel{
  DateTime? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  //Image? imageWeather;
  String? weatherStateName;

  WeatherModel({
   required this.date,
   required this.temp,
   required this.maxTemp,
   required this.minTemp,
   //required this.imageWeather,
   required this.weatherStateName,
  });
 factory WeatherModel.fromJson(dynamic data)
 {
   var jsonData = data['forecast']['forecastday'][0]['day'];
   return WeatherModel(
       //date: data['location']['localtime'],
       date: DateTime.parse(data['location']['localtime']),
       temp: jsonData['avgtemp_c'],
       maxTemp: jsonData['maxtemp_c'],
       minTemp: jsonData['mintemp_c'],
      // imageWeather:jsonData['condition']['icon'],
       weatherStateName: jsonData['condition']['text'],
   );
 }
String? getImage(){
  if(weatherStateName == 'Clear' ||
      weatherStateName == 'Light Cloud'||
      weatherStateName == 'Sunny')
  {
    return 'lib/assets/images/clear.png';
  }
  //return null;
  else if(weatherStateName == 'Sleet' ||
      weatherStateName == 'Hail'||
      weatherStateName == 'Light snow')
  {
    return 'lib/assets/images/snow.png';
  }
  else if(weatherStateName == 'Heavy Cloud'||
      weatherStateName == 'Partly cloudy'||
      weatherStateName == 'Cloudy')
  {
    return 'lib/assets/images/cloudy.png';
  }
  else if(weatherStateName == 'Light Rain' ||
      weatherStateName == 'Heavy rain'||
      weatherStateName == 'Showers')
  {
    return 'lib/assets/images/rainy.png';
  }
  else if(weatherStateName == 'Thunderstorm')
  {
    return 'lib/assets/images/thunderstorm.png';
  }
  else {
    return 'lib/assets/images/clear.png';
  }
}


  MaterialColor? getThemeColor(){
    if(weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud'||
        weatherStateName == 'Sunny')
    {
      return Colors.orange;

    }
    //return null;
    else if(weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail'||
        weatherStateName == 'Light snow')
    {
      return  Colors.blue;
    }
    else if(weatherStateName == 'Heavy Cloud'||
        weatherStateName == 'Partly cloudy')
    {
      return  Colors.blueGrey;
    }
    else if(weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy rain'||
        weatherStateName == 'Showers')
    {
      return Colors.blue;
    }
    else if(weatherStateName == 'Thunderstorm')
    {
      return Colors.cyan;
    }
    else {
      return Colors.orange;
    }
  }
}