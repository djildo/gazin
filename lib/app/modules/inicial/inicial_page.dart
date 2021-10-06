import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/modules/inicial/inicial_store.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatefulWidget {
  final String title;
  const InicialPage({Key? key, this.title = 'InicialPage'}) : super(key: key);
  @override
  InicialPageState createState() => InicialPageState();
}

class InicialPageState extends State<InicialPage> {
  final InicialStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.height / 4,
                          margin: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: Column(
                            children: [
                              Flexible(
                                child: Stack(
                                  children: <Widget>[],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
