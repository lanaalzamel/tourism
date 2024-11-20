// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tourest/getx_bindings/forgetpassword_bindings.dart';
import 'package:tourest/getx_bindings/login_binding.dart';
import 'package:tourest/getx_bindings/signup_bindings.dart';
import 'package:tourest/getx_bindings/verifycode_biging.dart';
import 'package:tourest/modules/forget_password/forget_password.dart';
import 'package:tourest/modules/home_screen/home_screen.dart';
import 'package:tourest/modules/log_in/log_in.dart';
import 'package:get/get.dart';
import 'package:tourest/modules/reset_password.dart/resetpassword.dart';
import 'package:tourest/modules/sign_up/sign_up.dart';
import 'package:tourest/modules/splash/splash.dart';
import 'package:tourest/modules/verifypassword/verifycode.dart';
import 'package:tourest/test.dart';
import 'package:tourest/translation/settings_screen.dart';
import 'package:tourest/translation/translation.dart';
import 'getx_bindings/resetpasswordbinding.dart';
import 'modules/booking/booking.dart';
import 'modules/onboarding/onboarding.dart';
import 'modules/payment/payment.dart';
import 'package:get/get.dart';
void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/payment',
      translationsKeys:AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en','Us'),

      getPages: [
        GetPage(name: '/login', page: () => LogIn(), binding: LoginBinding()),
        GetPage( name: '/signup', page: () => SignUp(), binding: registerBinding()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/SettingsScreen', page: () => SettingsScreen()),
        GetPage(name: '/payment',page: () => Payment(title: ('Payment'),)),
        GetPage(name: '/forgetpass',page: () => ForgetPassword(),binding: ForgetPasswordBinding()),
        GetPage(name: '/onboarding', page: () => onBoarding()),
        GetPage(name: '/verifycode',page: () => VerifyCode(),binding: verifyBinding()),
        GetPage(name: '/resetpassword',page: () => reSetPassword(),binding: reSetPasswordBinding()),
        GetPage(name: '/splash', page: () => splash()),
        //  GetPage(name: '/test', page: () =>DotStepperDemo() ),
      ],
      builder: EasyLoading.init(),
    ),
  );
}
