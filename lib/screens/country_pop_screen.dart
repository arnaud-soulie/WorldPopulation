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
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        DropdownButton(
          items: getCountryMenuList(),
          onChanged: (value) {
            setState(() {
              selectedCountry = value;
              print(selectedCountry);
            });
          },
          value: selectedCountry,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    image: Image.asset(
                      'icons/flags/png/${isoCodes[selectedCountry][1].toLowerCase()}.png',
                      package: 'country_icons',
                    ).image)),
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: WorldPopWidget(
                    datas: countrylist[selectedCountry],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
