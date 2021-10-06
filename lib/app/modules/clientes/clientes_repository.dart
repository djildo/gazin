import 'package:flutter/material.dart';
import 'package:teste/dio_controller.dart';
import 'package:teste/model/developer_model.dart';

class ClientesRepository {
  final dio = DioController();

  Future recuperar(BuildContext context, data) async {
    final response = await dio.get(context, 'developers', data);

    final list = response['data'] as List;
    return list.map((json) => Data.fromJson(json)).toList();
  }

  Future deletar(BuildContext context, data) async {
    final response = await dio.delete(context, 'developers', data);

    return response;
  }
}
