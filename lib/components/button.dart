import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onTap});
  final Color color;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Material(
          elevation: 5,
          color: color,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 300,
            height: 50,
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
