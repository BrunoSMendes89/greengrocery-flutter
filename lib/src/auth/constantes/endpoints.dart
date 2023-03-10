const String baseUrl = 'https://parseapi.back4app.com/classes/';

abstract class EndPoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/signup';
  static const String validateToken = '$baseUrl/validate-token';
 
}

abstract class StorageKeys {
  static const String token = 'token';
}