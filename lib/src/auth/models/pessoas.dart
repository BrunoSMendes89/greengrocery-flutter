class Pessoas {
  String? objectId;
  String? nome;
  String? email;
  String? senha;

  Pessoas({this.objectId, this.nome, this.email, this.senha});

  Pessoas.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
  }
}
