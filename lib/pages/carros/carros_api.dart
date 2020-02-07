import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TipoCarro{
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}



class CarrosApi {

  static Future<List<Carro>> getCarros(String tipo) async {


      Usuario user = await Usuario.get();


      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${user.token}"
      };

      //print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>. $headers >>>>>>>>>>>>>>>>>>>>>>>>>>>");

      var url = 'http://192.168.0.7:8080/api/v1/carros/tipo/$tipo';

      //print("GET> $url");

      var response = await http.get(url, headers: headers);

      String json = response.body;

      List list = convert.json.decode(json);

      List<Carro> carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();

      final dao = CarroDAO();

      //salva no banco de dados interno
      //carros.forEach(dao.save);
      carros.forEach(dao.save);

      return carros;
    
  }
}
