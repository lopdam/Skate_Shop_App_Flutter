// App

import 'package:flutter/material.dart';
import 'package:skate_shop_app/screens/home/home.dart';

class App extends StatelessWidget {
  static Map<int, Color> _color = {
    50: Color.fromRGBO(48, 25, 52, .1),
    100: Color.fromRGBO(48, 25, 52, .2),
    200: Color.fromRGBO(48, 25, 52, .3),
    300: Color.fromRGBO(48, 25, 52, .4),
    400: Color.fromRGBO(48, 25, 52, .5),
    500: Color.fromRGBO(48, 25, 52, .6),
    600: Color.fromRGBO(48, 25, 52, .7),
    700: Color.fromRGBO(48, 25, 52, .8),
    800: Color.fromRGBO(48, 25, 52, .9),
    900: Color.fromRGBO(48, 25, 52, 1),
    900: Color.fromRGBO(48, 25, 52, 1),
  };
  static MaterialColor _colorCustom = MaterialColor(0xFF301934, _color);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retro Skate",
      theme: ThemeData(primarySwatch: _colorCustom),
      home: Home(),
    );
  }
}
