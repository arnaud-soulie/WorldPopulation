import 'package:flutter/material.dart';
import 'package:worldpopulationcounter/widgets/world_population.dart';

class WorldPopScreen extends StatelessWidget {
  const WorldPopScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: Image.asset(
                'images/earth.png', //Image by truthseeker08 from Pixabay
              ).image)),
      child: Center(child: WorldPopWidget()),
    );
  }
}
