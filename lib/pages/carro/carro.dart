class Carro {
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

  Carro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    urlVideo = json['url_video'];
    urlFoto = json['url_foto'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
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
