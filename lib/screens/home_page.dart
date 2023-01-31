import 'package:flutter/material.dart';
//import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void updateUi(){
    setState(() {

    });
}
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
      body:weatherData == null ? Center(
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
      ):const CaseNull(),
    );
  }
}
class CaseNull extends StatelessWidget {
  const CaseNull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 3,),
          Text(
            'Cairo',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated: 12:11 pm',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('lib/assets/images/clear.png'),
              Text(
                '30',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'max:32',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 3.5,),
                  Text(
                    'min:20',
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
            'Clear',
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
