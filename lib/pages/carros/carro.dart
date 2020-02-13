import 'package:carros/utils/sql/entity.dart';

class Carro extends Entity{
  int id;
  String nome;
  String tipo;
  String longitude;
  String latitude;
  String urlVideo;
  String urlFoto;
  String descricao;

  Carro(
      {this.id,
        this.nome,
        this.tipo,
        this.longitude,
        this.latitude,
        this.urlVideo,
        this.urlFoto,
        this.descricao});

  Carro.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    tipo = map['tipo'];
    longitude = map['longitude'];
    latitude = map['latitude'];
    urlVideo = map['url_video'];
    urlFoto = map['url_foto'];
    descricao = map['descricao'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['tipo'] = this.tipo;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['url_video'] = this.urlVideo;
    data['url_foto'] = this.urlFoto;
    data['descricao'] = this.descricao;
    return data;
  }
}