import 'package:greengrocer/src/auth/models/pessoas.dart';

class PessoasService {
  List<Pessoas> getPessoas() {
    //final response = Pessoas('Bruno', 'email@teste', 'senha não disponível');
    List<Pessoas> myLista = [
      Pessoas("Wagner", "wagner@teste.com", "1234"),
      Pessoas("Bruno", "bruno@teste.com", "1234"),
      Pessoas("Mathues", "matheus@teste.com", "1234")
    ];
    return myLista;
  }
}
