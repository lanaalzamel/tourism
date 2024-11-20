import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tourest/models/user.dart';
import 'package:tourest/modules/sign_up/signup_service.dart';

class SignUpController extends GetxController {
  var name = '';
  var email = '';
  var password = '';
  var passwordConfirm = '';
  var card_number = '';
  var mobile = '';
  var signUpStatuse = false;
  var message;

  SignUpService service = SignUpService();

  Future<void> registerOnClick() async {
    User user = User(
      name: name,
      email: email,
      mobile: mobile,
      password: password,
      card_number: card_number,
    );

    signUpStatuse = await service.register(user);
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }
}
