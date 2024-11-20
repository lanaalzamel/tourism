// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.list,
            color: Colors.grey,
          ),
        ),
        title: Text(
          'HomePage',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
