import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:localstorage/localstorage.dart';
import 'package:teste/constants/api.dart';
import 'package:teste/dio_controller.dart';

class LoginStore extends NotifierStore<Exception, bool> {
  LoginStore() : super(false);

  Future<dynamic> logar(BuildContext context, String usuario, senha) async {
    final LocalStorage storage = new LocalStorage('pedeaki');
    final dio = DioController();

    setLoading(true);

    var body = {
      "USUARIO": usuario,
      "SENHA": senha,
    };

    final response = await dio.post(context, Api.login, body);

    if (response != null && response['success'] == true) {
      storage.setItem('jwt', response['token']);
      update(true);
      Modular.to.navigate('../home');
    } else {
      setError(Exception('Erro ao LOGAR.'));
    }

    setLoading(false);
  }

  Future<dynamic> tentar() async {
    setLoading(true);
    update(false);
    setLoading(false);
  }
}
