import 'package:flutter/material.dart';

class MenuIcon {
  IconData icone;
  String titulo;
  int id;
  bool fechar;
  int? idx;
  Widget? tela;

  MenuIcon({
    required this.icone,
    required this.titulo,
    required this.id,
    this.fechar = false,
    this.idx,
    this.tela,
  });
}
