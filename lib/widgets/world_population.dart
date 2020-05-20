import 'package:flutter/material.dart';
import 'dart:async';
import 'package:worldpopulationcounter/brain/world_population_calculator.dart';
import 'package:number_display/number_display.dart';

class WorldPopWidget extends StatefulWidget {
  @override
  _WorldPopWidgetState createState() => _WorldPopWidgetState();
}

class _WorldPopWidgetState extends State<WorldPopWidget> {
  Timer timer;
  int worldPopulation;
  final display = createDisplay(separator: ',', length: 15);

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
      '${worldPopulation != null ? display(worldPopulation) : 'Processing...'}',
      style: TextStyle(
          color: Colors.black87, fontSize: 30.0, fontWeight: FontWeight.w500),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
