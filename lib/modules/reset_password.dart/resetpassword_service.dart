import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tourest/config/server_config.dart';
import 'package:tourest/models/user.dart';

class ResetPasswordService {
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.resetpasswordcode);
  var message;
  Future<bool> register(User user) async {
    var response = await http.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {'resetpassword': user.resetpassword, 'password': user.password},
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = 'resetpassword succssfully';
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
