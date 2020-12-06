import 'dart:convert';

class casos {
  List<Null> tags;
  String sId;
  String titulo;
  String texto;
  Usuario usuario;
  Usuario categoria;
  Usuario subcategoria;
  String date;
  int iV;
  int pontuacao;

  casos(
      {this.tags,
      this.sId,
      this.titulo,
      this.texto,
      this.usuario,
      this.categoria,
      this.subcategoria,
      this.date,
      this.iV,
      this.pontuacao});

  casos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    titulo = json['titulo'];
    texto = json['texto'];
    usuario =
        json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
    categoria = json['categoria'] != null
        ? new Usuario.fromJson(json['categoria'])
        : null;
    subcategoria = json['subcategoria'] != null
        ? new Usuario.fromJson(json['subcategoria'])
        : null;
    date = json['date'];
    iV = json['__v'];
    pontuacao = json['pontuacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  
    data['_id'] = this.sId;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    if (this.usuario != null) {
      data['usuario'] = this.usuario.toJson();
    }
    if (this.categoria != null) {
      data['categoria'] = this.categoria.toJson();
    }
    if (this.subcategoria != null) {
      data['subcategoria'] = this.subcategoria.toJson();
    }
    data['date'] = this.date;
    data['__v'] = this.iV;
    data['pontuacao'] = this.pontuacao;
    return data;
  }
}

class Usuario {
  String sId;
  String nome;

  Usuario({this.sId, this.nome});

  Usuario.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['nome'] = this.nome;
    return data;
  }
}