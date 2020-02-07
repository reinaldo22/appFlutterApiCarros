
import 'package:carros/pages/carros/carro_page.dart';

import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'carro.dart';


class CarrosListView extends StatelessWidget {

  List<Carro> carros;
  CarrosListView(this.carros);


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: c.urlFoto != null
                          ? Image.network(
                        c.urlFoto,
                        width: 250,
                      )
                          : Image.network(
                        c.urlFoto ??
                            "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Text(
                      "descrição...",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text(
                            'Detalhes',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () => _onclickCarro(context, c),
                        ),
                        FlatButton(
                          child: const Text(
                            'Compartilhar',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onclickCarro(context, Carro c) {
    rotas(context, CarroPage(c));
  }

}