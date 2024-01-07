import 'package:flutter/material.dart';
import 'package:sqflite_login/components/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.validator,
    this.trailing,
    required this.onSubmitted,
  });
  final String hintText;
  final IconData icon;
  final FormFieldValidator? validator;
  final Widget? trailing;
  final TextEditingController controller;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          validator: validator,
          onFieldSubmitted: (value) {
            controller.text = value;
            onSubmitted();
          },
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(icon),
            suffixIcon: trailing,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
