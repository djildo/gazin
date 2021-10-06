import 'package:flutter/material.dart';

class MenuIes {
  IconData icone;
  String titulo;
  int id;
  Widget? tela;
  List<MenuIes>? submenu;
  String? rota;

  MenuIes({
    required this.icone,
    required this.titulo,
    required this.id,
    this.tela,
    this.submenu,
    this.rota,
  });
}
