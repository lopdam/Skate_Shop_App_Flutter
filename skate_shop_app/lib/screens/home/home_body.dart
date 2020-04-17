import 'package:flutter/cupertino.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 36,
          child: Column(
            children: <Widget>[
              Text(
                "Estamos Trabando...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Mientras puede buscar Boards.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
