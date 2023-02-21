import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_providers.dart';
import 'package:weather_app/screens/search_screen.dart';

import '../body_widget/case_not_null.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void updateUi(){
    setState(() {
    });
}
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context,listen: true).weatherData;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Weather App'),
        actions: [
         IconButton(
             onPressed: (){
               Navigator.push(
                 context,
                   MaterialPageRoute(
                       builder:(context){
                     return SearchScreen(
                       updateUi: updateUi,
                     );
                   }),
               );
             },
             icon: const Icon(
                 Icons.search,
             ),
         ),
        ],
      ),
      body: weatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
             Text(
              'There Is No Weather 😔 Start',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
             Text(
              'Searching Now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ) : CaseNotNull(),
    );
  }
}


