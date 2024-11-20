// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tourest/components/button.dart';
import 'package:tourest/components/mytextfield.dart';
import 'package:tourest/modules/forget_password/forgetpasswprd_controller.dart';
import 'package:tourest/size_config.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPasswordController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () {
            Get.offNamed('/login');
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.grey,
          ),
        ),
        title: Text(
          'Forget Password'.tr,
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Please enter your email and we will send \nyou a link to reset  your password'.tr,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.05,
                ),
                Form(
                  child: Column(
                    children: [
                      MyTextField(
                        hintText: 'enter your email'.tr,
                        icon: Icon(Icons.email_sharp),
                        onChanged: (value) {
                          controller.email = value;
                        },
                        labelText: 'Email'.tr,
                        keyboard: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(30),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.01,
                      ),
                      MyButton(
                        color: Colors.blue,
                        onTap: () {
                          onclickcheckemail();
                        },
                        title: 'Reset password'.tr,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.05,
                      ),
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
                          Text(
                            "Sign up".tr,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onclickcheckemail() async {
     EasyLoading.show(status: 'loading...'.tr);
    await controller.onclickcheckemail();
    if (controller.forgetpasswordstatus) {
        EasyLoading.showSuccess('success'.tr);
      print('success'.tr);
      Get.offNamed('/verifycode');
    } else {
      EasyLoading.showError('there is an error'.tr,
          duration: Duration(seconds: 10), dismissOnTap: true);
      print('error'.tr);
    }
  }
}
