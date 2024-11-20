import 'package:get/get.dart';
import 'package:tourest/modules/log_in/login_controller.dart';
class LoginBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }

}