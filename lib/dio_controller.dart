import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/io_client.dart';

final LocalStorage storage = new LocalStorage('gazin');

class DioController {
  Dio dio = Dio();
  final url = 'http://localhost:3000/v1/';

  chave() {
    Random random = new Random();
    DateTime d = new DateTime.now();
    String d1 = d.toString();
    String c1 = md5.convert(utf8.encode(d1)).toString();
    String c2 = md5.convert(utf8.encode(d1 + 'ies')).toString();
    int randomNumber = random.nextInt(9);
    int mes = d.month - 1;
    String data = randomNumber.toString() + '/' + mes.toString() + '/' + d.year.toString();
    String c31 = data + 'gazin';
    String c3 = md5.convert(utf8.encode(c31)).toString();
    return c1 + '-.' + c3 + '-.' + c2;
  }

  Future delete([BuildContext? context, page, data, int tipo = 1]) async {
    try {
      await storage.ready;
      var res;
      if (kIsWeb) {
        final response = await dio.delete(
          url + page,
          data: {"data": json.encode(data)},
          options: Options(
            headers: {"key": this.chave(), "Accept": "application/json", "Authorization": storage.getItem('jwt')},
          ),
        );
        res = response.data;
      } else {
        final ioc = new HttpClient();
        ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        final http = new IOClient(ioc);
        final response = await http.delete(
          Uri.parse(url + page),
          body: {"data": json.encode(data)},
          headers: {"key": this.chave(), "Accept": "application/json", if (storage.getItem('jwt') != null || storage.getItem('jwtCli') != null) "Authorization": storage.getItem('jwt')},
        );

        res = jsonDecode(response.body);
      }

      if (res['success']) {
        return res;
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(res['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    } on DioError catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.response?.data['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.message),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    }
  }

  Future post([BuildContext? context, page, data, int tipo = 1]) async {
    try {
      await storage.ready;
      var res;
      if (kIsWeb) {
        final response = await dio.post(
          url + page,
          data: {"data": json.encode(data)},
          options: Options(
            headers: {"key": this.chave(), "Accept": "application/json", "Authorization": storage.getItem('jwt')},
          ),
        );
        res = response.data;
      } else {
        final ioc = new HttpClient();
        ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        final http = new IOClient(ioc);
        final response = await http.post(Uri.parse(url + page),
            body: {"data": json.encode(data)}, headers: {"key": this.chave(), "Accept": "application/json", if (storage.getItem('jwt') != null || storage.getItem('jwtCli') != null) "Authorization": storage.getItem('jwt')});

        res = jsonDecode(response.body);
      }

      if (res['success']) {
        return res;
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(res['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    } on DioError catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.response?.data['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.message),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    }
  }

  Future put([BuildContext? context, page, data, int tipo = 1]) async {
    try {
      await storage.ready;
      var res;
      if (kIsWeb) {
        final response = await dio.put(
          url + page,
          data: {"data": json.encode(data)},
          options: Options(
            headers: {"key": this.chave(), "Accept": "application/json", "Authorization": storage.getItem('jwt')},
          ),
        );
        res = response.data;
      } else {
        final ioc = new HttpClient();
        ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        final http = new IOClient(ioc);
        final response = await http.put(
          Uri.parse(url + page),
          body: {"data": json.encode(data)},
          headers: {"key": this.chave(), "Accept": "application/json", if (storage.getItem('jwt') != null || storage.getItem('jwtCli') != null) "Authorization": storage.getItem('jwt')},
        );

        res = jsonDecode(response.body);
      }

      if (res['success']) {
        return res;
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(res['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    } on DioError catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.response?.data['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.message),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    }
  }

  Future get([BuildContext? context, page, param, int tipo = 1]) async {
    try {
      await storage.ready;
      var res;
      if (kIsWeb) {
        final response = await dio.get(url + page,
            queryParameters: param,
            options: Options(
              headers: {"key": this.chave(), "Accept": "application/json", if (storage.getItem('jwt') != '') "Authorization": storage.getItem('jwt')},
            ));
        res = response.data;
      } else {
        final ioc = new HttpClient();
        ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        final http = new IOClient(ioc);

        String params = '';
        param.forEach((k, v) {
          params = params + '$k=$v&';
        });

        final response = await http.get(Uri.parse(url + page + '?' + params), headers: {"key": this.chave(), "Accept": "application/json", if (storage.getItem('jwt') != null) "Authorization": storage.getItem('jwt')});

        res = jsonDecode(response.body);
      }

      if (res['success']) {
        return res;
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(res['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    } on DioError catch (e) {
      if (e.response != null) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.response?.data['mensagem']),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      } else {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          content: Text(e.message),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            label: 'FECHAR',
            onPressed: () {},
          ),
        ));
      }
      return null;
    }
  }
}
