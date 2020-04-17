// App

import 'package:flutter/material.dart';
import 'package:skate_shop_app/screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Retro Skate",
      theme: ThemeData(primarySwatch:Colors.deepPurple),
      home: Home(),
    );
  }
}
