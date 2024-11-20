import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tourest/modules/native/secure_storage.dart';
import 'package:tourest/modules/splash/splash_server.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../config/user_info.dart';

class splashController extends GetxController {
  late Securestorage _storage;
  late bool validitytoken;
  late splashservice _service; //underscor means private
  @override
  void onInit() async {
    super.onInit();
    validitytoken = false;
    _storage = Securestorage();
    await checkToken();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  //function read token
  Future<void> checkToken() async {
    String? token = await _storage.read('token');
    if (token != null) {
      await validtoken(token);
      if (validitytoken) {
        Userinformation.USER_TOKEN = token;
        Get.offAllNamed('/verifycode');
      } else {
        Get.offAllNamed('/login');
      }
    }
  }

  Future<void> validtoken(String token) async {
    validitytoken = await _service.checkvalid(token);
  }
}
