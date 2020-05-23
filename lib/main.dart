import 'package:flutter/material.dart';
import 'package:worldpopulationcounter/screens/world_pop_screen.dart';
import 'package:worldpopulationcounter/screens/country_pop_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('World Population Live'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.group),
                ),
                Tab(icon: Icon(Icons.flag)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            WorldPopScreen(),
            CountryPopScreen(),
            Icon(Icons.directions_transit),
          ]),
        ),
      ),
    );
  }
}
