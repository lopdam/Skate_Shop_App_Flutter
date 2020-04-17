import 'package:palette_generator/palette_generator.dart';

class SkateBoard {
  String _title;
  String _description;
  String _size;
  String _material;
  int _price;
  static String _generalPathImg = "assets/images/";
  String _imagePath;
  PaletteColor _colors;

  SkateBoard(
      {String title,
      String description,
      String size,
      String material,
      int price,
      String imagePath,
      PaletteColor colors}) {
    _title = title;
    _description = description;
    _size = size;
    _material = material;
    _price = price;
    _imagePath = imagePath;
    _colors = colors;
  }

  PaletteColor get colors => _colors;

  set colors(PaletteColor value) {
    _colors = value;
  }

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
  }

  static String get generalPathImg => _generalPathImg;

  static set generalPathImg(String value) {
    _generalPathImg = value;
  }

  int get price => _price;

  set price(int value) {
    _price = value;
  }

  String get material => _material;

  set material(String value) {
    _material = value;
  }

  String get size => _size;

  set size(String value) {
    _size = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }
}
