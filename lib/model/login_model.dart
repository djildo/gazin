class LoginModel {
  bool? success;
  String? mensagem;
  String? token;
  String? expires;

  LoginModel({this.success, this.mensagem, this.token, this.expires});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    mensagem = json['mensagem'];
    token = json['token'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['mensagem'] = this.mensagem;
    data['token'] = this.token;
    data['expires'] = this.expires;
    return data;
  }
}
