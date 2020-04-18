// Sakate Page Screen

import 'package:flutter/material.dart';
import 'package:skate_shop_app/models/skate_board.dart';
import 'package:skate_shop_app/util/util.dart';
import 'package:flutter/services.dart';

class SkatePage extends StatefulWidget {
  SkateBoard _skateBoard;

  SkatePage(this._skateBoard) : super();

  @override
  _SkatePage createState() {
    return _SkatePage(_skateBoard);
  }
}

class _SkatePage extends State<SkatePage> {
  SkateBoard _skateBoard;

  _SkatePage(this._skateBoard) : super();


  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);

  }


  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomPaint(
          painter: _BluePainter(_skateBoard.colors.color),
          child: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                _appBar(context),
                _contenido(context),
                _bottomShop(),
              ],
            ),
          ),
        ));
  }

  Widget _appBar(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: _skateBoard.colors.bodyTextColor,
            size: 32.0,
          ),
        ),
        SizedBox(
          width: 48.0,
        ),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                _skateBoard.title,
                style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                      letterSpacing: 14,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _contenido(BuildContext context) {
    return Expanded(
        child: Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0, top: 48, bottom: 48),
        child: Row(
          children: <Widget>[_imgBoard(), _info(context)],
        ),
      ),
    ));
  }

  Widget _info(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.only(left: 32, top: 48, bottom: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _skateBoard.description,
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 22.0),
          ),
          Expanded(
            child: Container(),
          ),
          Divider(),
          Expanded(
            child: Container(),
          ),
          Text(
            "SIZE",
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
          Text(
            _skateBoard.size,
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 22.0),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            "Material",
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
          ),
          Text(
            _skateBoard.material,
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 22.0),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),
          _priceTag(),
        ],
      ),
    ));
  }

  Widget _priceTag() {
    return Container(
      width: double.infinity,
      height: 48,
      color: Color(0xFFF1C929),
      alignment: Alignment.centerLeft,
      child: CustomPaint(
        painter: _DiePainter(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            "\$ " + _skateBoard.price.toString(),
            style: Theme.of(context).textTheme.headline.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                ),
          ),
        ),
      ),
    );
  }

  Widget _imgBoard() {
    return Container(
      width: 140,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage(
          SkateBoard.generalPathImg + _skateBoard.imagePath,
        ),
        fit: BoxFit.contain,
      )),
    );
  }

  Widget _bottomShop() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        width: double.infinity,
        height: 120,
        child: FlatButton(
          child: Text(
            "ADD TO CART",
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, letterSpacing: 10),
          ),
          onPressed: () {
            Util.shortToast(
                context: context, mensaje: _skateBoard.title + " add to Cart");
          },
        ));
  }
}

class _BluePainter extends CustomPainter {
  Color _color;

  _BluePainter(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = _color;

    final Rect rect = Rect.fromLTWH(0, 0, size.width * 0.25, size.height);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _DiePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.fill;

    var x = size.height / 6;
    var path = Path();
    path.moveTo(0, -2 * x);

    for (int i = 0; i < 5; i++) {
      path.relativeLineTo(x, x);
      path.relativeLineTo(-x, x);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
