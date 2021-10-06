import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste/app/modules/dashboard/dashboard_store.dart';
import 'package:flutter/material.dart';
import 'package:teste/app/modules/dashboard/totais_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final DashboardStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DashTotais(),
            ],
          ),
        ),
      ),
    );
  }
}
