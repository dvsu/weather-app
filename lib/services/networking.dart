import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Uri apiURL;

  Networking({required this.apiURL});

  Future<dynamic> getWeatherData() async {
    http.Response response = await http.get(apiURL);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 404) {
      return '';
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
