
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherServices{
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKay = '9844928248e8492398f203348231801';
  Future<WeatherModel> getWeather({
    required String cityName,
  })async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKay&q=$cityName&days=1'
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    //print(data);
    var jsonData = data['forecast']['forecastday'][0];
    WeatherModel weatherVar = WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
    );
      return weatherVar;////////////
  }
}
/*
// This Is Api Kay :
 http://api.weatherapi.com/v1/
 forecast.json?key=9844928248e8492398f203348231801&q=
 London&days=1&aqi=no&alerts=no
 */