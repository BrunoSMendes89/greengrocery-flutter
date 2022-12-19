import 'package:greengrocer/src/auth/models/pessoas.dart';

class PessoasService {
  List<Pessoas> getPessoas() {
    //final response = Pessoas('Bruno', 'email@teste', 'senha não disponível');
    List<Pessoas> myLista = [

      Pessoas("Wagner Garnizet", "wagner@teste.com", "1234"),
      Pessoas("Bruno Mendes", "bruno@teste.com", "1234"),
      Pessoas("Mathues Rodrigues", "matheus@teste.com", "1234")
    ];
    return myLista;
  }

  List<Pessoas>? getLogin(String email) {
    List<Pessoas> pessoa = getPessoas();
    pessoa.retainWhere((login) {
      return login.email.contains(email);
    });
    return null;

  }
}
