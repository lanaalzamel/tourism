import 'package:get/get.dart';
import 'package:tourest/models/user.dart';
import 'package:tourest/modules/log_in/login_service.dart';
import 'package:tourest/modules/native/secure_storage.dart';

class LoginController extends GetxController {
  var email;
  var password;
  var loginStatuse;
  var message;
  late loginService service;
  var checkBoxStatus = false.obs;

  void changeCheckBox() async {
    checkBoxStatus(!checkBoxStatus.value);
    Securestorage storage = Securestorage();
    String? test=await storage.read('token');
  }

  @override
  void onInit() {
    email = '';
    password = '';
    loginStatuse = false;
    message = '';
    service = loginService();
    super.onInit();
  }

  Future<void> loginOnClick() async {
    User user = User(
      email: email,
      password: password,
    );
    loginStatuse = await service.login(
      user,
    );
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) {
        temp += s + '\n';
      }
      message = temp;
    }
  }
}
