import 'package:get/get.dart';
import '../modules/verifypassword/verifycodecontroller.dart';

class verifyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<verifyCodeController>(verifyCodeController());
  }
}
