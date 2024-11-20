import 'package:get/get.dart';
import 'package:tourest/models/user.dart';
import 'package:tourest/modules/reset_password.dart/resetpassword_service.dart';

class reSetPasswordController extends GetxController {
  var resetpassword = '';
  var password = '';
  var ResetPasswordStatus = false;
  var message = '';
  ResetPasswordService service = ResetPasswordService();
  Future<void> restPasswordOnClick() async {
    User user = User(
      resetpassword: resetpassword,
      password: password,
    );

    ResetPasswordStatus = await service.register(user);
    print('there is an error');
  }
}
