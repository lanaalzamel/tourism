// ignore_for_file: prefer_const_constructors
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourest/components/button.dart';
import 'package:tourest/components/mytextfield.dart';
import 'package:tourest/modules/sign_up/signup_controller.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
          'reigester'.tr,
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
                      'Register Account'.tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Complete your details \n or countinue with social media'.tr,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      hintText: 'enter your name'.tr,
                      icon: Icon(Icons.person),
                      onChanged: (value) {
                        controller.name = value;
                      },
                      labelText: 'Name'.tr,
                    ),
                  ),
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
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      hintText: 'mobile'.tr,
                      icon: Icon(Icons.phone),
                      onChanged: (value) {
                        controller.mobile = value;
                      },
                      labelText: 'Mobile'.tr,
                      keyboard: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyTextField(
                      hintText: 'card numbr'.tr,
                      icon: Icon(Icons.money),
                      onChanged: (value) {
                        controller.card_number = value;
                      },
                      labelText: 'card number'.tr,
                      keyboard: TextInputType.phone,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyButton(
                      color: Colors.blue,
                      title: 'Continue'.tr,
                      onTap: () {
                        onClickRegister();
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child:
                            SvgPicture.asset('images/svgs/icons8-facebook.svg'),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.blue),
                          shape: BoxShape.circle,
                        ),
                        child:
                            SvgPicture.asset('images/svgs/icons8-google.svg'),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.blue),
                          shape: BoxShape.circle,
                        ),
                        child:
                            SvgPicture.asset('images/svgs/icons8-twitter.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    "By continuing your confirm that you agree \nwith our terms and conditions".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onClickRegister() async {
    EasyLoading.show(status: 'loading...');
    await controller.registerOnClick();
    if (controller.signUpStatuse) {
      EasyLoading.showSuccess('success'.tr);
      print('success');
      Get.offNamed('/login');
    } else {
      EasyLoading.showError('there is an error'.tr,
          duration: Duration(seconds: 10), dismissOnTap: true);
      print('error');
    }
  }
}
