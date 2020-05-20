import 'package:flutter/material.dart';
import 'package:worldpopulationcounter/datas.dart';

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
        children: <Widget>[
          DropdownButton(
            items: getCountryMenuList(),
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
            value: selectedCountry,
          )
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
