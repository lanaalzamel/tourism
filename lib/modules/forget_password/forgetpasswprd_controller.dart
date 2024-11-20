import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tourest/config/server_config.dart';
import 'package:tourest/modules/forget_password/forgetpassword_service.dart';

import '../../models/code.dart';

class ForgetPasswordController extends GetxController {
  var code;
  var email;
  var message;
  var forgetpasswordstatus = false;
  forgetPasswordService service = forgetPasswordService();

  Future<void> onclickcheckemail() async {
    Code code = Code(email: email);
    forgetpasswordstatus = await service.forgetpassword(code);
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      print(message);
      message = temp;
    }
  }
}
