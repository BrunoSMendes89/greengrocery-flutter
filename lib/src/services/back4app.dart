
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Back4app {


  static Future<void> initParse() async {
    const keyApplicationId = 'P6qq5wnEa4W3kbzoW7qsgCCem8g78vk1f72jCftH';
    const keyClientKey = '7ANS6L8jIKWXsPXa74bk6GWmtwoJlBdW3DoaUdQ8';
    const keyParseServerUrl = 'https://parseapi.back4app.com/';

    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);

    var usuarioDB = ParseObject('FirstClass')
      ..set('message', 'Aguardando conexão com Banco de dados!')
      ..set('watched', 2);
    await usuarioDB.save();
  }
}
