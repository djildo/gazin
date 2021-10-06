import 'dart:convert';

class ModelDevelopers {
  bool? success;
  List<Data>? data;

  ModelDevelopers({this.success, this.data});

  ModelDevelopers.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(jsonDecode(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data!.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  int? idDevelopers;
  String? nome;
  String? sexo;
  String? idade;
  String? hobby;
  String? datanascimento;

  Data(
      {this.idDevelopers,
      this.nome,
      this.sexo,
      this.idade,
      this.hobby,
      this.datanascimento});

  Data.fromJson(Map<String, dynamic> json) {
    idDevelopers = json['id_developers'];
    nome = json['nome'];
    sexo = json['sexo'];
    idade = json['idade'];
    hobby = json['hobby'];
    datanascimento = json['datanascimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_developers'] = this.idDevelopers;
    data['nome'] = this.nome;
    data['sexo'] = this.sexo;
    data['idade'] = this.idade;
    data['hobby'] = this.hobby;
    data['datanascimento'] = this.datanascimento;
    return data;
  }
}
