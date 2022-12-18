import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'Digite seu email';
  }
  if (!email.isEmail) return 'Digite um email válido!';
  return null;
}

String? passwordValidator(password) {
  if (password == null || password.isEmpty) {
    return 'Digite sua senha';
  }
  if (password.toString().length < 4) {
    return 'Digite uma senha com pelo menos 4 caracteres!';
  }
  return null;
}

String? nomeValidator(String? nome) {
  if (nome == null || nome.isEmpty) {
    return 'Digite seu nome';
  }

  final nomes = nome.split(' ');
  if (nomes.length ==1) return 'Digite seu nome e sobrenome!';
  return null;
}