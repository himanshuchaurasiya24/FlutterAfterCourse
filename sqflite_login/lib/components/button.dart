import 'package:flutter/material.dart';
import 'package:sqflite_login/components/colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.press,
  });
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      width: size.width * 0.9,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
      ),
      child: TextButton(
        onPressed: press,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
