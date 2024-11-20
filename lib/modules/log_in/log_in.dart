// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourest/components/button.dart';
import 'package:tourest/components/checkbos.dart';
import 'package:tourest/modules/log_in/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tourest/components/mytextfield.dart';

import '../../api/googlesigninapi.dart';

class LogIn extends StatelessWidget {
  bool _obsecureText = true;
  LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Login'.tr,
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Welcome back'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Sign in with your email and password \n or countinue with social media'.tr,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      hintText: 'enter your email'.tr,
                      icon: Icon(Icons.email_sharp),
                      onChanged: (value) {
                        controller.email = value;
                      },
                      labelText: 'Email'.tr,
                      keyboard: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextField(
                        hintText: 'enter your password'.tr,
                        icon: Icon(Icons.lock),
                        onChanged: (value) {
                          controller.password = value;
                        },
                        labelText: 'Password'.tr,
                        icon1: Icon(Icons.remove_red_eye),
                        keyboard: TextInputType.visiblePassword,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Obx(
                          () {
                            return CustomCheckbox(
                              iconSize: 20,
                              size: 20,
                              isSelected: controller.checkBoxStatus.value,
                              onTap: () {
                                controller.changeCheckBox();
                              },
                            );
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Remember me'.tr),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/forgetpass');
                          },
                          child: Text(
                            'Forget password'.tr,
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyButton(
                    color: Colors.blue,
                    onTap: () {
                      onClickLogin();
                    },
                    title: 'Continue'.tr,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        // onTap: () => SignIn(),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child:
                              SvgPicture.asset('images/svgs/icons8-google.svg'),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                              'images/svgs/icons8-twitter.svg'),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                              'images/svgs/icons8-facebook.svg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Don't have an account?".tr,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap:(){ Get.toNamed('/signup');},
                        child: Text(
                          "Sign up".tr,
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickLogin() async {
    EasyLoading.show(status: 'loading...');
    await controller.loginOnClick();
    if (controller.loginStatuse) {
      EasyLoading.showSuccess('done'.tr);
      Get.offNamed('/home');
    } else {
      EasyLoading.showError('there is an error'.tr,
          duration: Duration(seconds: 2), dismissOnTap: true);
      print('error here'.tr);
    }
  }

  // Future SignIn() async {
  //   await GoogleSignInApi.login();
  // }
}
import 'package:get/get.dart';
import '../../models/user.dart';
import '../../native_service/secure_storage.dart';
import 'login_service.dart';

class LoginController extends GetxController {
  var email;
  var password;
  var loginStatuse;
  var message;
  late LoginService service;
  var checkBoxStatus = false.obs;

  void changeCheckBox() async {
    checkBoxStatus(!checkBoxStatus.value);
    Securestorage storage = Securestorage();
    String? test=await storage.read('token');
  }

  @override
  void onInit() {
    super.onInit();
    email = '';
    password = '';
    loginStatuse = false;
    message = '';
    service = LoginService();
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
Future<void> loginOnClick() async {
  User user = User(
    email: email.value,
    password: password.value,
  );
  loginStatuse.value = await service.login(user);
}
}