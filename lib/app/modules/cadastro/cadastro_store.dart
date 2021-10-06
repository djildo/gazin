import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:teste/app/app_store.dart';
import 'package:teste/app/modules/cadastro/cadastro_repository.dart';
import 'package:teste/app/modules/clientes/clientes_page.dart';
import 'package:teste/constants/route_names.dart';
import 'package:teste/model/menuIcon_model.dart';
import 'package:teste/model/menu_model.dart';

class CadastroStore extends NotifierStore<Exception, int> {
  CadastroStore() : super(0);
}

class CadastroController {
  final store = CadastroRepository();

  Future<dynamic> logar(
      BuildContext context, nome, sexo, idade, hobby, data) async {
    var body = {
      "nome": nome,
      "sexo": sexo,
      "idade": idade,
      "hobby": hobby,
      "data": data,
    };

    dynamic res = await store.gravar(context, body);

    return res;
  }

  Future<void> navigateTo(
      BuildContext context, String routeName, int menu) async {
    Navigator.pop(context);
    List<MenuIcon> _lista = Modular.get<AppStore>().state;
    final tela = _lista.where((element) => element.id == menu);
    MenuIes lista = new MenuIes(
        icone: Icons.people_sharp,
        id: 2,
        titulo: 'Developers',
        tela: ClientesPage(),
        rota: RouteNames.developer);

    if (tela.isEmpty) {
      await Modular.get<AppStore>().increment(lista);
    } else {
      List<MenuIcon> x = tela.toList();
      await Modular.get<AppStore>().atualiza(x[0].idx);
    }
  }
}
