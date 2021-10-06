import 'package:flutter/material.dart';
import 'package:teste/app/modules/cadastro/cadastro_page.dart';
import 'package:teste/app/modules/clientes/clientes_page.dart';
import 'package:teste/app/modules/inicial/inicial_page.dart';
import 'package:teste/constants/route_names.dart';
import 'package:teste/model/menu_model.dart';

final List<MenuIes> listaMenu = [
  new MenuIes(
      icone: Icons.home,
      id: 1,
      titulo: 'Home',
      tela: InicialPage(),
      rota: RouteNames.home),
  new MenuIes(
      icone: Icons.people_sharp,
      id: 2,
      titulo: 'Developers',
      tela: ClientesPage(),
      rota: RouteNames.developer),
  new MenuIes(
      icone: Icons.person_add_alt,
      id: 3,
      titulo: 'Cadastro',
      tela: CadastroPage(),
      rota: RouteNames.cadastro),
];
