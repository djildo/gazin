import 'package:teste/app/modules/clientes/clientes_store.dart';
import 'package:teste/app/modules/clientes/clientes_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientesStore()),
    Bind.lazySingleton((i) => ClientesRepository()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
