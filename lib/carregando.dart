import 'package:flutter/material.dart';

class Carregando extends StatelessWidget {
  const Carregando({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          child: Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              backgroundColor: Colors.black12,
            ),
          ),
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
