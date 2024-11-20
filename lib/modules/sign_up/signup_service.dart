import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourest/config/server_config.dart';
import 'package:tourest/models/user.dart';

class SignUpService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);
  var message;
  Future<bool> register(User user) async {
    var response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'name': '${user.name}',
        'Mobile': user.mobile,
        'email': user.email,
        'password': user.password,
        'card_number': user.card_number,
      },
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200|| response.statusCode==201) {
      var jsonResponse = jsonDecode(response.body);
      message = 'signin succssfully';
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];
      return false;
    } else {
      return false;
    }
  }
}
