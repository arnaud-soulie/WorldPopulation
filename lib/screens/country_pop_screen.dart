import 'package:flutter/material.dart';
import 'package:worldpopulationcounter/datas.dart';
import 'package:worldpopulationcounter/widgets/world_population.dart';
import 'package:country_icons/country_icons.dart';

class CountryPopScreen extends StatefulWidget {
  @override
  _CountryPopScreenState createState() => _CountryPopScreenState();
}

class _CountryPopScreenState extends State<CountryPopScreen> {
  String selectedCountry = 'France';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 25.0,
          ),
          DropdownButton(
            items: getCountryMenuList(),
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
            value: selectedCountry,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WorldPopWidget(
                  datas: countrylist[selectedCountry],
                ),
                Image.asset(
                  'icons/flags/png/${isoCodes[selectedCountry][1].toLowerCase()}.png',
                  package: 'country_icons',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem> getCountryMenuList() {
    List<DropdownMenuItem<String>> myList = List<DropdownMenuItem<String>>();
    countrylist.forEach((element, _) {
      myList.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return myList;
  }
}
