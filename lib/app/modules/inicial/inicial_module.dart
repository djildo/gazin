import 'package:teste/app/modules/inicial/inicial_Page.dart';
import 'package:teste/app/modules/inicial/inicial_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InicialModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InicialStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InicialPage()),
  ];
}
