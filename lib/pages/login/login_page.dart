import 'package:carros/pages/login/api_response.dart';
import 'package:carros/pages/carro/home_Page.dart';
import 'package:carros/pages/login/usuario.dart';

import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widget/app_botoes.dart';
import 'package:carros/widget/app_text.dart';
import 'package:flutter/material.dart';

import 'login_api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controladores
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();

    Future<Usuario> future = Usuario.get();
    future.then((Usuario user) {
      if (user != null) {
        rotas(context, HomePage(), replace: true);
      }
    });
  }

  //vALidador do formulário
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "Login",
              "Digite o nome",
              controller: _tLogin,
              validator: _validateLogin,
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              "Senha",
              "Digite a senha",
              controller: _tSenha,
              validator: _validateSenha,
            ),
            SizedBox(
              height: 20,
            ),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickLogin() async {
    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login  Senha: $senha");

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);
    if (response.ok) {
      Usuario user = response.result;
      print(">>>>>>>>> $user");
      rotas(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
    setState(() {
      _showProgress = false;
    });
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Insira a senha";
    }
    return null;
  }
}
