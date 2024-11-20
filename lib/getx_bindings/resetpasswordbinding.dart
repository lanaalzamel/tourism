import 'package:get/get.dart';
import 'package:tourest/modules/log_in/login_controller.dart';

import '../modules/reset_password.dart/resetpassword_controller.dart';
class reSetPasswordBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<reSetPasswordController>(reSetPasswordController());
  }

}