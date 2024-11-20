import 'package:get/get.dart';
import 'package:tourest/modules/forget_password/forget_password.dart';

import '../modules/forget_password/forgetpasswprd_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ForgetPasswordController>(ForgetPasswordController());
  }
}
