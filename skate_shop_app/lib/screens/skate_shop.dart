// List Board

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:skate_shop_app/models/board_item.dart';
import 'package:skate_shop_app/models/skate_board.dart';

class SkateShop extends StatefulWidget {
  @override
  _SkateShop createState() {
    // TODO: implement createState
    return _SkateShop();
  }
}

class _SkateShop extends State<SkateShop> with SingleTickerProviderStateMixin {
  List<SkateBoard> data = null;
  ScrollController _scrollController;
  double rotation = 0;
  double scrollStartAt = 0;

  Color backgroundColor = Colors.white;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      var dx = _scrollController.offset - scrollStartAt;

      setState(() {
        rotation = dx / 50;
        if (rotation > 1) {
          rotation = 1;
        } else if (rotation < -1) {
          rotation = -1;
        }
        if (_scrollController.offset > 50) {
          backgroundColor = data.last.colors.color;
        } else {
          backgroundColor = data.first.colors.color;
        }
      });
    });

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animationController.addListener(() {
      setState(() {
        rotation = rotation.sign * _animationController.value;
      });
    });

    _initializeColors().then((list) {
      setState(() {
        data = list;
        backgroundColor = data.first.colors.color;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<List<SkateBoard>> _initializeColors() async {
    var images = [
      "board1.png",
      "board2.png",
      "board3.png",
      "board4.png",
      "board5.png",
      "board6.png",
      "board7.png",
      "board8.png",
      "board9.png",
      "board10.png",
      "board11.png",
      "board12.png",
      "board13.png",
      "board14.png",
      "board15.png",
      "board16.png",
      "board17.png",
      "board18.png",
    ];
    List<SkateBoard> list = [];
    for (String image in images) {
      String imgPath = "assets/images/" + image;
      PaletteGenerator colors =
          await PaletteGenerator.fromImageProvider(AssetImage(imgPath));
      list.add(SkateBoard(image, colors.dominantColor));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: backgroundColor,
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            _animationController.reverse(from: rotation.abs());
          }
          if (notification is ScrollStartNotification) {
            scrollStartAt = _scrollController.offset;
          }
        },
        child: ListView(
          controller: _scrollController,
          children: <SkateItemWidget>[
            for (SkateBoard board in data)
              SkateItemWidget(
                rotation: rotation,
                title: "SLIME MONSTER",
                imagePath: board.imagePath,
                price: "\$ 240",
                colors: board.colors,
              ),
          ],
        ),
      ),
    );
  }
}
