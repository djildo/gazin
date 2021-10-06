import 'package:flutter/material.dart';
import 'package:teste/dio_controller.dart';

class CadastroRepository {
  final dio = DioController();

  Future gravar(BuildContext context, data) async {
    final response = await dio.post(context, 'developers', data);

    return response;
  }
}
