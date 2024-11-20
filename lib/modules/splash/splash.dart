import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //decoration: ,
          child: Image.asset('images/logo.jpg'),
        ),
      ),
    );
  }
}
