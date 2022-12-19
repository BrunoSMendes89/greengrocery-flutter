import 'package:http/http.dart' as http;

const baseUrl = 'https://parseapi.back4app.com/classes/usuario';

class API {
  static Future getUsers() async {
    var kParseApplicationId = 'P6qq5wnEa4W3kbzoW7qsgCCem8g78vk1f72jCftH';
    var kParseClientKey = 'uPSMcWchOxBmeazty5evjV6haVeR7LCBByT0I1fI';
    var url = baseUrl;
    return await http.get(
      Uri.parse(url),
      headers: {
        'content-type': 'application/json',
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-Client-Key': kParseClientKey,
      },
    );
  }
}
