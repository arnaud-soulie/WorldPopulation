import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25.0),
      child: LinkText(
        text:
            'This simple app has been developed using Flutter framework, seen https://flutter.dev .\n\n'
            'The source code is available on Github: https://github.com/arnaud-soulie/WorldPopulation\n\n'
            'Datas from the UN are used to compute the current population estimation: https://population.un.org/wpp/Download/Standard/Population/\n\n'
            'The data displayed is a simple computation based on the current exact date and yearly prediction.',
        textStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
