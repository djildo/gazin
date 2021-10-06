import 'package:teste/app/modules/cadastro/cadastro_store.dart';
import 'package:teste/app/modules/cadastro/cadastro_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CadastroStore()),
    Bind.lazySingleton((i) => CadastroRepository()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
