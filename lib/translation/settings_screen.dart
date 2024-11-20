import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourest/components/button.dart';
import 'package:tourest/translation/languages.dart';
import 'package:tourest/translation/languages_controller.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final LangaugesController _controller = Get.put(LangaugesController());

  //  final AuthenticationManager _authenticationManager = Get.put(AuthenticationManager());

  String x = 'xx';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [],
        title: Text('settingsscreen'.tr),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(30), child: languageChooser()),
          // Text('rrrr'.tr),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 0, right: 100),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout_outlined,
                size: 50,
              ),
            ),
          ),
          Text('logout'.tr),
          MyButton(
              color: Colors.blue,
              title: 'Continue'.tr,
              onTap: () {
                Get.toNamed('/onboarding');
              }),
        ],
      ),
    );
  }

  DropdownButton languageChooser() {
    return DropdownButton<String>(
        isExpanded: false,
        hint: Text('change language'),
        // Not necessary for Option 1
        value: _controller.selectedLanguage?.value,
        onChanged: (symbol) {
          _controller.changeLanguage = symbol;
        },
        items: languages.map((LanguageModel _language) {
          print(_language.language);
          return DropdownMenuItem<String>(
            child: new Text(_language.language),
            value: _language.symbol,
          );
        }).toList());
  }
}
