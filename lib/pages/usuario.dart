class Usuario {
  String login;
  String email;
  String nome;
  String token;

  List<String> roles;
  //
  Usuario.fromJson(Map<String, dynamic> map) {
    login = map["login"];
    email = map["email"];
    nome = map["nome"];
    token = map["token"];
    roles = map["roles"] != null
        ? map["roles"].map<String>((role) => role.toString()).toList()
        : null;
  }
  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token, roles: $roles}';
  }
}
