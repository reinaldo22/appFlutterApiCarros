import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/simple_bloc.dart';
import 'package:carros/utils/network.dart';

import 'favorito_service.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {

  Future<List<Carro>> fetch() async {
    try {
      List<Carro> carros = await FavoritoService.getCarros();

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }
  }
}
