import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
//import 'package:teste/app/modules/dashboard/dashboard_page.dart';
import 'package:teste/model/menuIcon_model.dart';
import 'package:teste/model/menu_model.dart';

import 'modules/inicial/inicial_page.dart';

class AppStore extends NotifierStore<Exception, List<MenuIcon>> {
  AppStore()
      : super([
          MenuIcon(
            icone: Icons.menu_outlined,
            titulo: '',
            id: 0,
            idx: 0,
            tela: InicialPage(),
          ),
          MenuIcon(
            icone: Icons.home,
            titulo: 'HOME',
            id: 1,
            idx: 1,
            tela: InicialPage(),
          ),
        ]);

  Future<void> increment(MenuIes tela) async {
    setLoading(true);

    late final _total = state.toList();

    late MenuIcon novo = MenuIcon(
        icone: Icons.check,
        titulo: tela.titulo,
        id: tela.id,
        fechar: true,
        tela: tela.tela,
        idx: _total.length);

    List<MenuIcon> lista = state;

    lista.add(novo);

    await Modular.get<IndexStore>().atualiza(_total.length);

    await Future.delayed(Duration(milliseconds: 50));
    update(lista.toList());

    setLoading(false);
  }

  Future<void> fechar(int idx) async {
    setLoading(true);

    List<MenuIcon> lista = state;

    lista.removeAt(idx);

    await Modular.get<IndexStore>().atualiza(lista.length - 1);

    await Future.delayed(Duration(milliseconds: 100));
    update(lista.toList());

    setLoading(false);
  }

  Future<void> atualiza(id) async {
    setLoading(true);

    late final _total = state.toList();

    await Modular.get<IndexStore>().atualiza(id);

    await Future.delayed(Duration(milliseconds: 50));
    update(_total.toList());

    setLoading(false);
  }
}

class IndexStore extends StreamStore<Exception, int> {
  IndexStore() : super(1);

  atualiza(idx) {
    update(idx);
  }
}
