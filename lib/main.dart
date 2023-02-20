import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_providers.dart';
import 'package:weather_app/screens/home_screen.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: const MyApp())
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
      primarySwatch: Provider.of<WeatherProvider>(context).
      weatherData == null ? Colors.red : Provider.of<WeatherProvider>(context).
      weatherData!.getThemeColor(),
        //brightness:Brightness.light or Brightness.dark
      ),
      home:  HomeScreen(),
    );
  }
}