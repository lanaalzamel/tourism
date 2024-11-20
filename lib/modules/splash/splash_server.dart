
import 'package:http/http.dart' as http;
import 'package:tourest/config/server_config.dart';

class splashservice {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.check_valid);
  var message;

  Future<bool> checkvalid(String token) async {
    var response = await http.get(
      url,

      headers: {'Accept': 'application/json'},
      //{'authorization': 'bearer $token'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 402) {
      message = 'Sesion Expired';
      return false;
    } else {
      message = 'server error';
      return false;
    }

    return true;
  }
}
