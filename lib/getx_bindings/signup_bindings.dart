import 'package:get/get.dart';
import 'package:tourest/modules/sign_up/signup_controller.dart';

class registerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignUpController>(SignUpController());
  }
}
