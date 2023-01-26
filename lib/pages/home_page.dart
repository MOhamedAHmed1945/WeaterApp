import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Weather App'),
        actions: [
         IconButton(
             onPressed: (){
               Navigator.push(
                 context,
                   MaterialPageRoute(builder:(context){
                     return SearchPage();
                   }),
               );
             },
             icon: const Icon(
                 Icons.search,
             ),
         ),
        ],
      ),
      body: Center(
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
      ),
    );
  }
}