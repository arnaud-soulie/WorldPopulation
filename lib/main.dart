import 'dart:async';

import 'package:flutter/material.dart';
import 'world_population_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Container(
              child: WorldPopWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class WorldPopWidget extends StatefulWidget {
  const WorldPopWidget({
    Key key,
  }) : super(key: key);

  @override
  _WorldPopWidgetState createState() => _WorldPopWidgetState();
}

class _WorldPopWidgetState extends State<WorldPopWidget> {
  Timer timer;
  int worldPopulation;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              worldPopulation =
                  WorldPopCalculator().getTotalPopulation().round();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${worldPopulation != null ? worldPopulation : 'Calculating...'}',
      style: TextStyle(color: Colors.black),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
