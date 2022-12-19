import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:greengrocer/src/auth/screens/sign_in_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'P6qq5wnEa4W3kbzoW7qsgCCem8g78vk1f72jCftH';
  const keyClientKey = '7ANS6L8jIKWXsPXa74bk6GWmtwoJlBdW3DoaUdQ8';
  const keyParseServerUrl = 'https://parseapi.back4app.com/';
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);


  if (kDebugMode) {
    print('done');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lista de Usuários',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
        
      home: SignInScreen(),
    );
  }
}

Future<Map<String, dynamic>> getLogin(String email) async {
  QueryBuilder<ParseObject> queryPerson =

      QueryBuilder<ParseObject>(ParseObject('usuario'))
        ..whereEqualTo('email', email);
  final ParseResponse apiResponse = await queryPerson.query();

  if (apiResponse.success && apiResponse.results != null) {
    final name = apiResponse.results?.first.get<String>('nome');
    final password = apiResponse.results!.first.get<String>('senha');
    return {'nome': name, 'senha': password};
  } else {
    return {};
  }
}

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