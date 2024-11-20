import 'package:http/http.dart ' as http;
import 'package:tourest/config/server_config.dart';
import 'package:tourest/models/code.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class forgetPasswordService {
  var url =
      Uri.parse(ServerConfig.domainNameServer + ServerConfig.forgetpassword);
  var message;
  Future<bool> forgetpassword(Code code) async {
    var response = await http.post(url,
        headers: {'Accept': 'application/json'}, body: {'email': code.email});
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
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
