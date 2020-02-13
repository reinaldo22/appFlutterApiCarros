import 'package:carros/pages/carros/simple_bloc.dart';
import 'package:carros/utils/network.dart';

import 'carro.dart';
import 'carro_dao.dart';
import 'carros_api.dart';

class CarrosBloc extends SimpleBloc<List<Carro>>{

  Future<List<Carro>> fetch(String tipo) async {
    try {
      if(! await isNetworkOn()) {
        // Busca do banco de dados
        List<Carro> carros =  await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

      final dao = CarroDAO();

      // Salvar todos os carros
      carros.forEach(dao.save);

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }
  }
}