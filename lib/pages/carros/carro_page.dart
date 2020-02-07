import 'package:carros/pages/carros/carro.dart';
import 'package:carros/widget/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: _onclickPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                ),
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Image.network(carro.urlFoto),
            _bloco1(),
            Divider(),
            _bloco2(),
          ],
        ));
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onclickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("Delette!!!!");
        break;
      case "Deletar":
        print("Deletado!!!");
        break;
      case "Share":
        print("Sharezado");
        break;
    }
  }

  void _onClickFavorito() {}

  void _onClickShare() {}

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(
              carro.nome,
              fontSize: 20,
              bold: true,
            ),
            text(
              carro.tipo,
              fontSize: 16,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 40,
              ),
              onPressed: _onClickFavorito,
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            ),
          ],
        ),
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text("Descrição: ${carro.nome}", fontSize: 16, bold: true),
        SizedBox(height: 20,),
        text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus metus est, rhoncus id nisl eget, sodales auctor mauris. Mauris vel laoreet lacus. Morbi et tortor felis. Aenean gravida mi a tellus finibus ullamcorper. Vivamus posuere, massa vestibulum suscipit imperdiet, ipsum lectus maximus lacus, tincidunt laoreet odio leo et nisl. Donec eleifend nibh sed lectus porta, vitae suscipit turpis egestas. Proin non odio et ligula volutpat consequat. Sed pellentesque maximus metus, non feugiat sem convallis eu. Integer tempus efficitur aliquam. Donec posuere orci non ante sodales, in iaculis tellus tincidunt. Nullam ultricies mi in blandit porttitor. Nunc pulvinar sem quis sapien consectetur, quis cursus magna tristique. Proin ut hendrerit purus.")
      ],
    );
  }
}
