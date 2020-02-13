import 'package:carros/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario {
  String login;
  String nome;
  String email;
  String urlFoto;
  String token;
  List<String> roles;

  //
  Usuario(
      {this.login,
      this.nome,
      this.email,
      this.urlFoto,
      this.token,
      this.roles});

  Usuario.fromJson(Map<String, dynamic> map) {
    login = map["login"];
    email = map["email"];
    nome = map["nome"];
    token = map["token"];
    roles = map["roles"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;

    return data;
  }

  static void clear() {
    Prefs.setString("user.prefs", "");
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }
    Map map = convert.json.decode(json);

    Usuario user = Usuario.fromJson(map);

    return user;
  }

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome,email: $email,urlFoto: $urlFoto,token: $token,roles: $roles}';
  }
}
