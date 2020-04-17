import 'package:flutter/material.dart';
import 'package:skate_shop_app/models/skate_board.dart';
import 'package:skate_shop_app/screens/skate_page.dart';

class SkateItemWidget extends StatelessWidget {
  SkateBoard _skateBoard;
  double _rotation;

  SkateItemWidget({Key key, SkateBoard skateBoard, double rotation}) {
    _skateBoard = skateBoard;
    _rotation = rotation;
  }

  SkateBoard get skateBoard => _skateBoard;

  set skateBoard(SkateBoard value) {
    _skateBoard = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _skateBoard.colors.color,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Stack(
          children: <Widget>[
            _titleCard(),
            _priceCard(),
            _board(context),
          ],
        ),
      ),
    );
  }

  Widget _titleCard() {
    return Positioned(
        left: 0,
        right: 0,
        top: 0,
        child: Text(
          _skateBoard.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: _skateBoard.colors.bodyTextColor,
              letterSpacing: 10,
              fontWeight: FontWeight.w700),
        ));
  }

  Widget _priceCard() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Text(
          "\$ " + _skateBoard.price.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: _skateBoard.colors.bodyTextColor,
              letterSpacing: 10,
              fontWeight: FontWeight.w700),
        ));
  }

  Widget _board(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push((MaterialPageRoute(
            builder: (BuildContext context) => SkatePage(this._skateBoard))));
      },
      child: RotatedBox(
          quarterTurns: 3,
          child: Transform(
            transform: Matrix4.rotationY(_rotation),
            alignment: FractionalOffset.center,
            child: Center(
                child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: _skateBoard.colors.bodyTextColor,
                        blurRadius: 50,
                        offset: Offset(50 * _rotation, 0),
                      )
                    ]),
                    child: Image.asset(
                        SkateBoard.generalPathImg + _skateBoard.imagePath))),
          )),
    );
  }
}
