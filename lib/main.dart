import 'package:flutter/material.dart';
import 'package:worldpopulationcounter/widgets/world_population.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
          ),
          body: TabBarView(children: <Widget>[
            Center(
              child: Container(
                child: WorldPopWidget(),
              ),
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ]),
        ),
      ),
    );
  }
}
