import 'package:flutter/material.dart';
import 'package:teste/responsive.dart';

class DashTotais extends StatefulWidget {
  const DashTotais({Key? key}) : super(key: key);

  @override
  _DashTotaisState createState() => _DashTotaisState();
}

class _DashTotaisState extends State<DashTotais> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.amber,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.blue,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.cyanAccent,
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
