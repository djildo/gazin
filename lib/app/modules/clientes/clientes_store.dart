import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:teste/app/modules/clientes/clientes_repository.dart';
import 'package:teste/model/developer_model.dart';

class ClientesStore extends NotifierStore<Exception, int> {
  ClientesStore() : super(0);
}

class ClientesController {
  final store = ClientesRepository();
  final state = ValueNotifier<pState>(pState.start);
  List<Data> todos = [];

  Future<dynamic> listar(BuildContext context) async {
    var body = {"start": 0, "page": 1, "limit": 50};

    try {
      final List<Data> res = await store.recuperar(context, body);
      state.value = pState.success;

      if (res != null) {
        todos = res;
      }
    } catch (e) {
      state.value = pState.error;
    }
  }

  Future<dynamic> apagar(BuildContext context, int dev) async {
    var body = {"id_developers": dev};

    try {
      final dynamic res = await store.deletar(context, body);
      state.value = pState.success;

      if (res != null) {
        if (!res.success) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Erro ao excluir Developer :('),
            duration: Duration(seconds: 2),
            action: SnackBarAction(
              label: 'FECHAR',
              onPressed: () {},
            ),
          ));
        }

        listar(context);
      }
    } catch (e) {
      state.value = pState.error;
    }
  }
}

enum pState { start, loading, success, error }
