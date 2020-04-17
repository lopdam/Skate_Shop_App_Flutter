//HomeScreen App

import 'package:flutter/material.dart';
import 'package:skate_shop_app/screens/home/home_body.dart';
import 'package:skate_shop_app/screens/home/home_drawer.dart';
import 'package:skate_shop_app/screens/boards_page/skate_shop.dart';
import 'package:skate_shop_app/values/strings.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: _appBar(),
      body: HomeBody(),
    );
  }

  Widget _appBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SkateShop()));
            }),
      ],
      title: Text(Strings.titleHome),
      elevation: 6.0,
      centerTitle: true,

    );
  }

  void _openBoardsShop(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => SkateShop()));
  }
}
