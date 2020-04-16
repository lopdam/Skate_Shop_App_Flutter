
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:skate_shop_app/screens/skate_page.dart';

class SkateItemWidget extends StatelessWidget {
  final String title;
  final String imagePath;
  final String price;
  final PaletteColor colors;
  final String generalPathImg = "assets/images/";
  final double rotation;

  SkateItemWidget(
      {Key key,
        this.title,
        this.imagePath,
        this.price,
        this.colors,
        this.rotation});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors.color,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colors.bodyTextColor,
                      letterSpacing: 10,
                      fontWeight: FontWeight.w700),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Text(
                  price,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: colors.bodyTextColor,
                      letterSpacing: 10,
                      fontWeight: FontWeight.w700),
                )),
            _board(context),
          ],
        ),
      ),
    );
  }

  Widget _board(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
            builder: (BuildContext context) => SkatePage(this))));
      },
      child: RotatedBox(
          quarterTurns: 3,
          child: Transform(
            transform: Matrix4.rotationY(rotation),
            alignment: FractionalOffset.center,
            child: Center(
                child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: colors.bodyTextColor,
                        blurRadius: 50,
                        offset: Offset(50 * rotation, 0),
                      )
                    ]),
                    child: Image.asset(generalPathImg + imagePath))),
          )),
    );
  }
}
