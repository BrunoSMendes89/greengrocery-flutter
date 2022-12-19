import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PessoasService {

Future<List<ParseObject>> listaPessoas() async {
  QueryBuilder<ParseObject> queryPessoas =
      QueryBuilder<ParseObject>(ParseObject('usuario'));
  final ParseResponse apiResponse = await queryPessoas.query();
  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

}
