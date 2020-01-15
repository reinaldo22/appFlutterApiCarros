import 'dart:convert';

import 'package:carros/pages/login/api_response.dart';
import 'package:carros/pages/login/usuario.dart';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {

    try{
      var url = 'http://192.168.0.7:8080/api/v1/login';

      //Passa de map para json
      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {'username': login, 'password': senha};
      String s = json.encode(params);
      print(">>>> $s");
      var response = await http.post(url, body: s, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body": ${response.body}');

      //Passa de json para Map
      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);

        user.save();

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    }catch(error, exception){
      print("Error no login $error > $exception");
      return ApiResponse.error("Não foi possìvel fazer o login");
    }
  }
}
