import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class Util {
  static void shortToast({BuildContext context, String mensaje}) {
    Toast.show(mensaje, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

  static void longToast({BuildContext context, String mensaje}) {
    Toast.show(mensaje, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
  }
}
